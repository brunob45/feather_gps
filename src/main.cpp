// this sketch will allow you to bypass the Atmega chip
// and connect the Ultimate GPS directly to the USB/Serial
// chip converter.

// Connect VIN to +5V
// Connect GND to Ground
// Connect GPS RX (data into GPS) to Digital 0
// Connect GPS TX (data out from GPS) to Digital 1

#include <Arduino.h>
#include "sd_card.h"
#include "display.h"
#include "pins.h"
#include "gps.h"

constexpr char loading[] = {'|', '/', '-', '\\'};

void setup()
{
    uint32_t begin = millis();

    pinMode(LED_BUILTIN, OUTPUT);
    digitalWrite(LED_BUILTIN, HIGH);

    Serial.begin(115200);

    Display::init();

    pinMode(SD_CS, OUTPUT);

    // SD::init();

    GPS::init();

    digitalWrite(LED_BUILTIN, LOW);
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

        Display::reset();

        s = String(loading[cpt]) + '\n';
        cpt = (cpt + 1) % 4;

        if (GPS.fix)
        {
            s += printGPS();
        }
    }
    else if (s.length() > 0)
    {
        // SPI transactions are synchronous, so print 1 character per cycle to minimize cycle time
        Display::print(s[0]);
        s = s.substring(1);
    }
}