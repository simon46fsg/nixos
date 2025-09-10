{ pkgs, inputs, ... }: 
let
    myCustomKeyboardLayout = builtins.path {
        path = ./de_easy_symbols;
        name = "de_easy_symbols";
    };
in
{
  services.xserver.xkb.extraLayouts.de_easy_symbols = {
    description = "DE layout with nice symbol layer";
    languages = [ "de" ];
    symbolsFile = myCustomKeyboardLayout;
  };

  services.xserver.xkb = {
    layout = "de_easy_symbols";
    variant = "";
  };

  console.keyMap = "de_easy_symbols";
}
