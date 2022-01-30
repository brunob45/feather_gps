
#include <Arduino.h>
#include <display.h>
#include <Adafruit_ST7735.h>

namespace Display
{
    Adafruit_ST7735 tft = Adafruit_ST7735(TFT_CS, TFT_DC, TFT_RST);

    void init()
    {
        tft.initR(INITR_BLACKTAB);
        tft.setRotation(1);
        tft.setTextSize(3);
        tft.setTextColor(ST77XX_CYAN, ST77XX_BLACK);
        tft.fillScreen(ST77XX_BLACK);
    }

    void reset()
    {
        tft.setCursor(0, 0);
    }

    void print(char c)
    {
        tft.print(c);
    }
}