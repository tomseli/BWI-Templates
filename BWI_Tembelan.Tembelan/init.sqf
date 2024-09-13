// Add an arsenal
private _arsenal = spawn_arsenal;
[_arsenal] call BwiArsenal_fnc_addArsenal;

// Add radio presets 
["ACRE_PRC152", "default", 1, "label", "PLNET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 2, "label", "AIRNET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 3, "label", "CMDNET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 1, "label", "PLNET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 2, "label", "AIRNET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 3, "label", "CMDNET"] call acre_api_fnc_setPresetChannelField;

// add a callback to closing the arsenal display, to initialize radio channels 
// execution is delayed by 1 second to allow ACRE to initialize the radios
["ace_arsenal_displayClosed", {
	// configure the radios
	0 spawn {
		sleep 1;
		call BwiArsenal_fnc_configureRadios;
	};

	// save loadouts for use in "onPlayerRespawn.sqf"
	player setVariable["loadout", getUnitLoadout player];
}] call CBA_fnc_addEventHandler;