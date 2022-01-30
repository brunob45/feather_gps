
#include <Adafruit_GPS.h>
#include "gps.h"

namespace GPS {
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

    Adafruit_GPS GPS(&Serial1);

    void init()
    {
        GPS.begin(9600);
        delay(1000);
        GPS.sendCommand(PMTK_SET_NMEA_OUTPUT_RMCONLY);
        GPS.sendCommand(PMTK_SET_NMEA_UPDATE_5HZ);
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

        uint16_t speed = uint16_t(speed * 1.852f); // knots to km/h
        if (speed < 10)
            s += "  ";
        else if (speed < 100)
            s += " ";
        s += String(speed) + ' ';

        s += directions[int(GPS.angle / 45)];

        return s + '\n';
    }

    String update()
    {
        String s;
        GPS.read();

        if (GPS.newNMEAreceived())
        {
            GPS.parse(GPS.lastNMEA());

            if (GPS.fix)
            {
                s += printGPS();
            }
        }
        return s;
    }
}