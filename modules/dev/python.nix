{lib,pkgs,config,...}:
{
  home.packages = with pkgs; [
    pipenv
    kaggle
    python312
    python312Packages.dbt-core
    python312Packages.pandas
    python312Packages.pyspark
    python312Packages.seaborn
    python312Packages.dash
    virtualenv
  ];
}
