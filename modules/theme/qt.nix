{
qt = {
       enable = true;
       platformTheme.name = "kvantum";
      style.name = "kvantum";
       
   
     };

  xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
[General]
theme=Obsidian-Green
useThemeColors=true
'';

xdg.configFile."Kvantum/Obsidian-Green/Obsidian-Green.kvconfig".text = ''
[General]
bg=#1b1b1b
fg=#e0e0e0
accent=#00a86b
disabled=#555555
alt_bg=#242424
highlight_fg=#1b1b1b
'';

}
