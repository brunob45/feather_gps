// this sketch will allow you to bypass the Atmega chip
// and connect the Ultimate GPS directly to the USB/Serial
// chip converter.

// Connect VIN to +5V
// Connect GND to Ground
// Connect GPS RX (data into GPS) to Digital 0
// Connect GPS TX (data out from GPS) to Digital 1

#include <Arduino.h>
#include <Adafruit_GPS.h>
#include <Adafruit_ST7735.h>

#define TFT_CS 2
#define TFT_RST 3 // Or set to -1 and connect to Arduino RESET pin
#define TFT_DC 5

constexpr char const *directions[] =
    {
        " N ",
        "N-E",
        " E ",
        "S-E",
        " S ",
        "S-O",
        " O ",
        "N-O",
};

constexpr char loading[] = {'|', '/', '-', '\\'};

Adafruit_GPS GPS(&Serial1);
Adafruit_ST7735 tft = Adafruit_ST7735(TFT_CS, TFT_DC, TFT_RST);

void setup()
{
    uint32_t begin = millis();

    pinMode(LED_BUILTIN, OUTPUT);
    digitalWrite(LED_BUILTIN, HIGH);

    Serial.begin(115200);
    GPS.begin(9600);

    tft.initR(INITR_BLACKTAB);
    tft.setRotation(1);
    tft.setTextSize(3);
    tft.setTextColor(ST77XX_CYAN, ST77XX_BLACK);
    tft.fillScreen(ST77XX_BLACK);

    // wait for 1.5 seconds
    while (millis() - begin < 1500)
        delay(1);

    GPS.sendCommand(PMTK_SET_NMEA_OUTPUT_RMCONLY);
    GPS.sendCommand(PMTK_SET_NMEA_UPDATE_2HZ);
    GPS.sendCommand(PMTK_SET_BAUD_57600);
    Serial1.end();
    GPS.begin(57600);

    digitalWrite(LED_BUILTIN, LOW);
}

String printGPS()
{
    String s;

    GPS.hour = (GPS.hour + 19) % 24;

    if (GPS.hour < 10)
        s += '0';
    s += String(GPS.hour);
    s += ':';

    if (GPS.minute < 10)
        s += '0';
    s += String(GPS.minute);
    s += ':';

    if (GPS.seconds < 10)
        s += '0';
    s += String(GPS.seconds) + '\n';

    s += String(GPS.speed * 1.852f) + ' ';
    s += String(directions[int(GPS.angle / 45)]) + '\n';

    return s;
}

void loop()
{
    static String s;
    static uint8_t cpt;
    static uint32_t cycle_time, cycle_begin;

    uint32_t now = millis();

    GPS.read();

    if (GPS.newNMEAreceived())
    {
        uint32_t usage = 100 * cycle_time / (now - cycle_begin);
        cycle_begin = now;

        digitalWrite(LED_BUILTIN, usage >= 100);

        GPS.parse(GPS.lastNMEA());

        tft.setCursor(0, 0);

        s = loading[cpt];
        cpt = (cpt + 1) % 4;

        if (usage < 10)
            s += "   ";
        else if (usage < 100)
            s += "  ";
        else
            s += " ";
        s += String(usage) + "%\n";

        if (GPS.fix)
        {
            s += printGPS();
        }

        tft.print(s);
        cycle_time = millis() - cycle_begin;
    }
    // else if (s.length() > 0)
    // {
    //     // SPI transactions are synchronous, so print 1 character per cycle
    //     tft.print(s[0]);
    //     s = s.substring(1);
    //     if (s.length() == 0)
    //         cycle_time = millis() - cycle_begin;
    // }
}