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

		rm -rf ${home}/.config/hyfetch
		mkdir ${home}/.config/hyfetch
		chown ${username}:${group} ${home}/.config/hyfetch
		chmod 700 ${home}/.config/hyfetch

		rm -rf ${home}/.config/macchina
		mkdir ${home}/.config/macchina
		chown ${username}:${group} ${home}/.config/macchina
		chmod 700 ${home}/.config/macchina

		rm -rf ${home}/.config/neofetch
		mkdir ${home}/.config/neofetch
		chown ${username}:${group} ${home}/.config/neofetch
		chmod 700 ${home}/.config/neofetch
		
		cp ${./fastfetch_config.jsonc} ${home}/.config/fastfetch/fastfetch_config.jsonc
		cp ${./fastfetch_gurulandia.jsonc} ${home}/.config/fastfetch/fastfetch_gurulandia.jsonc
		chown ${username}:${group} ${home}/.config/fastfetch/*.jsonc
		chmod 600 ${home}/.config/fastfetch/*.jsonc

		cp ${./gl.txt} ${home}/.config/fastfetch/gl.txt
		chown ${username}:${group} ${home}/.config/fastfetch/gl.txt
		chmod 600 ${home}/.config/fastfetch/gl.txt

		cp ${./hyfetch/*.json} ${home}/.config/hyfetch
		chown ${username}:${group} ${home}/.config/hyfetch/*.json
		chmod 600 ${home}/.config/hyfetch/*.json
		ln -sf ${home}/.config/hyfetch/fastfetch.json ${home}/.config/hyfetch.json

		cp ${./macchina/macchina.toml} ${home}/.config/macchina/macchina.toml
		chown ${username}:${group} ${home}/.config/macchina/macchina.toml
		chmod 600 ${home}/.config/macchina/macchina.toml

		cp ${./neofetch/config.conf} ${home}/.config/neofetch/config.conf
		chown ${username}:${group} ${home}/.config/neofetch/config.conf
		chmod 600 ${home}/.config/neofetch/config.conf

	'';
	
	environment.systemPackages = with pkgs; [
		fastfetch
		hyfetch
		macchina
	];
}
