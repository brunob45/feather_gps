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
#include <SD.h>

#define SerialGPS Serial0

#define TFT_CS PIN_PD3
#define TFT_RST PIN_PD4 // Or set to -1 and connect to Arduino RESET pin
#define TFT_DC PIN_PD5
#define TFT_LIT PIN_PD0

#define SD_CS PIN_PA7

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

static Adafruit_GPS GPS(&SerialGPS);
static Adafruit_ST7735 tft = Adafruit_ST7735(TFT_CS, TFT_DC, TFT_RST);

static Sd2Card card;
static SdVolume volume;
static SdFile root;

static float sdsize;

void setup()
{
    uint32_t begin = millis();

    pinMode(LED_BUILTIN, OUTPUT);
    pinMode(TFT_LIT, OUTPUT);
    analogWrite(TFT_LIT, 255);
    digitalWrite(LED_BUILTIN, HIGH);

    Serial.begin(115200);
    GPS.begin(9600);

    tft.initR(INITR_BLACKTAB);
    tft.setRotation(1);
    tft.setTextColor(ST77XX_CYAN, ST77XX_BLACK);
    tft.fillScreen(ST77XX_BLACK);

    if (!card.init(SPI_HALF_SPEED, SD_CS))
    {
        tft.println("SD initialization failed.");
        while (1)
            ;
    }
    if (!volume.init(card)) {
        tft.println("Could not find partition.");
        while (1)
            ;
    }

    uint32_t volumesize = volume.blocksPerCluster();    // clusters are collections of blocks
    volumesize *= volume.clusterCount();       // we'll have a lot of clusters
    volumesize /= 2;                           // SD card blocks are always 512 bytes (2 blocks are 1 KB)
    volumesize /= 1024;
    sdsize = volumesize / 1024.0f;

    tft.setTextSize(3);

    // wait for 1.5 seconds
    while (millis() - begin < 1500)
        delay(1);

    GPS.sendCommand(PMTK_SET_NMEA_OUTPUT_RMCONLY);
    GPS.sendCommand(PMTK_SET_NMEA_UPDATE_5HZ);
    GPS.sendCommand(PMTK_SET_BAUD_57600);
    SerialGPS.end();
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

    uint16_t speed = uint16_t(GPS.speed * 1.852f);
    if (speed < 10)
        s += "  ";
    else if (speed < 100)
        s += " ";
    s += String(speed) + ' ';

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
        // indicate that the display couldn't keep up
        digitalWrite(LED_BUILTIN, s.length() > 0);

        GPS.parse(GPS.lastNMEA());

        tft.setCursor(0, 0);
        s = String(sdsize) + ' ';
        s += String(loading[cpt]) + '\n';
        cpt = (cpt + 1) % 4;

        if (GPS.fix)
        {
            s += printGPS();
        }
    }
    else if (s.length() > 0)
    {
        // SPI transactions are synchronous, so print 1 character per cycle to minimize cycle time
        tft.print(s[0]);
        s = s.substring(1);
    }
}