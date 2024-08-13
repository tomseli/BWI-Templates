private _radio_ids = [] call acre_api_fnc_getCurrentRadioList;
private _group = roleDescription player splitString "@" select 1;

// DEBUG	
systemChat format ["%1", _radio_ids];

{
	// DEBUG
	systemChat format ["Checking radio: %1 with group %2", _x, _group];
	
	private _channel = 1;

	if (_x find "prc343" != -1) then {
		switch (_group) do {
			case "Platoon": { 
				_channel = 1;
			};
			case "Alpha": {
				_channel = 2;
			};
			case "Bravo": { 
				_channel = 3;
			};
			case "Charlie": { 
				_channel = 4;
			};
			case "Zulu": { 
				_channel = 5;
			};
			case "Yankee": { 
				_channel = 6;
			};
			case "X-ray": { 
				_channel = 7;
			};
			default { 
				systemChat "Group not recognized, contact Zeus";
			};
		};
	};

	if (_x find "prc152" != -1) then {
		switch (_group) do {
			case "Platoon": {
				_channel = 3;
			};
			case "Alpha";
			case "Bravo";
			case "Charlie";
			case "Zulu";
			case "Yankee";
			case "X-ray": { 
				_channel = 1;
			};
			default {
				systemChat "Group not recognized, contact Zeus";
			};
		};
	};

	if (_x find "prc117f" != -1) then {
		switch (_group) do {
			case "Platoon";
			case "Alpha";
			case "Bravo";
			case "Charlie";
			case "Zulu";
			case "Yankee";
			case "X-ray": { 
				_channel = 1;
			};
			default {
				systemChat "Group not recognized, contact Zeus";
			};
		};
	};

	// DEBUG 
	systemChat format ["Selected channel %1 for radio %2", _channel, _x];

	[_x, _channel] call acre_api_fnc_setRadioChannel;
} forEach _radio_ids;