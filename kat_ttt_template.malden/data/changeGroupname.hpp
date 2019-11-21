class KAT_template_Button {
    deletable = 0;
    fade = 0;
    type = 1;
    text = "";
    colorText[] = {1, 1, 1, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    colorBackground[] = {0, 0, 0, 0.5};
    colorBackgroundDisabled[] = {0, 0, 0, 0.5};
    colorBackgroundActive[] = {0, 0, 0, 1};
    colorFocused[] = {0, 0, 0, 1};
    colorShadow[] = {0, 0, 0, 0};
    colorBorder[] = {0, 0, 0, 1};
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter", 0.09, 1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush", 0.09, 1};
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape", 0.09, 1};
    style = 2;
    x = 0;
    y = 0;
    w = 0.095589;
    h = 0.039216;
    shadow = 2;
    font = "PuristaMedium";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    offsetX = 0;
    offsetY = 0;
    offsetPressedX = 0;
    offsetPressedY = 0;
    borderSize = 0;
};
class KAT_template_IGUIBack {
    type = 0;
    idc = 124;
    style = 128;
    text = "";
    colorText[] = {0, 0, 0, 0};
    font = "PuristaMedium";
    sizeEx = 0;
    shadow = 0;
    x = 0.1;
    y = 0.1;
    w = 0.1;
    h = 0.1;
    colorbackground[] =
    {
        "(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])",
        "(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])",
        "(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])",
        "(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"
    };
};
class KAT_template_Edit {
    deletable = 0;
    fade = 0;
    type = 2;
    x = 0;
    y = 0;
    h = 0.04;
    w = 0.2;
    colorBackground[] = {0, 0, 0, 1};
    colorText[] = {0.95, 0.95, 0.95, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    colorSelection[] =
    {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
        1
    };
    autocomplete = "";
    text = "";
    size = 0.2;
    style = "0x00 + 0x40";
    font = "PuristaMedium";
    shadow = 2;
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    canModify = 1;
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {1, 1, 1, 1};
    tooltipColorShade[] = {0, 0, 0, 0.65};
};

class KAT_template_changeGroupName {
    idd = 3456;
    onLoad = "uiNamespace setVariable ['KAT_template_changeGroupName', _this select 0]; _this call KAT_template_fnc_changeGroupNameInit";
    class controls {
        class ButtonOk: KAT_template_Button {
            idc = 1600;
            text = $STR_kat_template_changeGroupName;
            x = 0.419792 * safezoneW + safezoneX;
            y = 0.478009 * safezoneH + safezoneY;
            w = 0.160417 * safezoneW;
            h = 0.0219914 * safezoneH;
            action = "_this call KAT_template_fnc_changeGroupNameCallback";
        };
        class Backround: KAT_template_IGUIBack {
            idc = 2200;
            x = 0.414063 * safezoneW + safezoneX;
            y = 0.434026 * safezoneH + safezoneY;
            w = 0.171875 * safezoneW;
            h = 0.07697 * safezoneH;
        };
        class EditText: KAT_template_Edit {
            idc = 1400;
            x = 0.419792 * safezoneW + safezoneX;
            y = 0.445021 * safezoneH + safezoneY;
            w = 0.160417 * safezoneW;
            h = 0.0219914 * safezoneH;
        };
    };
};
