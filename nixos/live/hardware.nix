{ pkgs, ... }:
{
  console = {
    earlySetup = true;
    # Pixel sizes of the font: 12, 14, 16, 18, 20, 22, 24, 28, 32
    # Followed by 'n' (normal) or 'b' (bold)
    font = "ter-powerline-v22n";
    packages = [ pkgs.terminus_font pkgs.powerline-fonts ];
  };
}
