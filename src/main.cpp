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
    Serial.begin(115200);
    GPS.begin(9600);

    tft.initR(INITR_BLACKTAB);
    tft.setRotation(1);
    tft.setTextSize(3);
    tft.setTextColor(ST77XX_CYAN, ST77XX_BLACK);
    tft.fillScreen(ST77XX_BLACK);

    delay(1000);

    GPS.sendCommand(PMTK_SET_NMEA_OUTPUT_RMCONLY);
    GPS.sendCommand(PMTK_SET_BAUD_57600);
    Serial1.end();
    GPS.begin(57600);
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

    GPS.read();

    if (GPS.newNMEAreceived())
    {
        GPS.parse(GPS.lastNMEA());

        tft.setCursor(0, 0);

        s = loading[cpt] + String('\n');
        cpt = (cpt + 1) % 4;

        if (GPS.fix)
        {
            s += printGPS();
        }
    }
    else if (s.length() > 0)
    {
        // SPI transactions are synchronous, so print 1 character per cycle
        tft.print(s[0]);
        s = s.substring(1);
    }
}