import QtQuick 2.0
import com.qnx.a16.ui 2.0

Item {
    x:0;
    y:0;
    Home{
        visible:_screenmanger.currentScreen===ScreenManager.HomeScreen;
    }
    PhonePage{
        x:114;
        visible:_screenmanger.currentScreen===ScreenManager.PhoneSreen;
    }
    CalculatorPage{
        x:114;
        visible:_screenmanger.currentScreen===ScreenManager.CalScreen;
    }

}
