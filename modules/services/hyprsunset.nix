{ config, pkgs, ...}:
{
  home.packages = with pkgs; [
    hyprsunset
  ];

  services.hyprsunset = {
    enable = true;
    
    settings = {
	max-gamma = 150;
	profile = [
		{
			time = "7:30";
			identity  = true;
			temperature = 4500;
			gamma = 100;
		}
		{
			time = "19:00";
			temperature = 4000;
			gamma = 0.8;
		}
	];
    };
  };

}


