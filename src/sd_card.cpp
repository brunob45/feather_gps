
#include <Arduino.h>
#include <SD.h>

namespace SD
{
    Sd2Card card;
    SdVolume volume;
    SdFile root;

    void init()
    {
        if (!card.init(SPI_HALF_SPEED, SD_CS))
        {
            tft.print("SD initialization failed.");
            while (true)
                ;
        }
    }

    String print()
    {
        String s;
        switch (card.type())
        {
        case SD_CARD_TYPE_SD1:
            s += "SD1";
            break;
        case SD_CARD_TYPE_SD2:
            s += ("SD2");
            break;
        case SD_CARD_TYPE_SDHC:
            s += ("SDHC");
            break;
        default:
            s += ("Unknown");
        }
        return s;
    }

}