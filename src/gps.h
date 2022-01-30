#ifndef GPS_H_
#define GPS_H_

#include <Arduino.h>

namespace GPS {
    void init();
    String update();
}

#endif // GPS_H_