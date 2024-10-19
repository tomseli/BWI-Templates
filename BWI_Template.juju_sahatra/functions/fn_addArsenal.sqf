params["_arsenal"];

// add an arsenal without items
[_arsenal, false] call ace_arsenal_fnc_initBox;

// Warning: abuses the fact that Windows is case-insensitive
// Loadouts are listed in alphabetical order in-game
private _loadouts = [
	"Automatic rifleman",
	"Combat first responder",
	"Grenadier",
	"Medium anti-tank gunner",
	"Medium anti-tank leader",
	"Medium machine gun gunner",
	"Medium machine gun leader",
	"Platoon leader",
	"Rifleman",
	"Squad Leader",
	"Logistics"
];

{	
	private _path = format ["data\%1.sqf", _x];
	private _loadout = call compile preprocessFile _path;
	[_x, _loadout, true] call ace_arsenal_fnc_addDefaultLoadout;
	[_arsenal, flatten _loadout, true] call ace_arsenal_fnc_addVirtualItems;
} forEach _loadouts;

// add attachments and other peripheral items
private _peripherals = ["attachments", "miscellaneous"];

{
	private _path = format ["data\%1.sqf", _x];
	private _peripheral = call compile preprocessFile _path;
	[_arsenal, flatten _peripheral, true] call ace_arsenal_fnc_addVirtualItems;
}forEach _peripherals;