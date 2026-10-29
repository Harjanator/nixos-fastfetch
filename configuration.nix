{ config, pkgs, ... }:

let
	username = config.username;
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.fastfetch = ''
		mkdir -p ${home}/.config
		chown ${username}:${group} ${home}/.config
		chmod 700 ${home}/.config

		rm -rf ${home}/.config/fastfetch
		mkdir ${home}/.config/fastfetch
		chown ${username}:${group} ${home}/.config/fastfetch
		chmod 700 ${home}/.config/fastfetch

		cp ${./config.jsonc} ${home}/.config/fastfetch/config.jsonc
		chown ${username}:${group} ${home}/.config/fastfetch/config.jsonc
		chmod 600 ${home}/.config/fastfetch/config.jsonc

		cp ${./gl.txt} ${home}/.config/fastfetch/gl.txt
		chown ${username}:${group} ${home}/.config/fastfetch/gl.txt
		chmod 600 ${home}/.config/fastfetch/gl.txt

	'';
	
	environment.systemPackages = with pkgs; [
		fastfetch
	];
}
