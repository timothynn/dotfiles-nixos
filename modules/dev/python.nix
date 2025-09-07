{lib,pkgs,config,...}:
{
  home.packages = with pkgs; [
    pipenv
    kaggle
    python312Full
    python312Packages.dbt-core
  ];
}
