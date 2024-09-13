private _radio_ids = [] call acre_api_fnc_getCurrentRadioList;
private _group = roleDescription player splitString "@" select 1;

{
	private _channel = 1;

	if (_x find "prc343" != -1) then {
		switch (_group) do {
			case "Platoon";
			case "Logistics": {
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
				systemChat "Group not recognized, contact Zeus. Set channel manually.";
			};
		};
	};

	if (_x find "prc152" != -1) then {
		switch (_group) do {
			case "Platoon";
			case "Logistics" : {
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
				systemChat "Group not recognized, contact Zeus. Set channel manually.";
			};
		};
	};

	if (_x find "prc117f" != -1) then {
		switch (_group) do {
			case "Platoon";
			case "Logistics";
			case "Alpha";
			case "Bravo";
			case "Charlie";
			case "Zulu";
			case "Yankee";
			case "X-ray": { 
				_channel = 1;
			};
			default {
				systemChat "Group not recognized, contact Zeus. Set channel manually.";
			};
		};
	};

	[_x, _channel] call acre_api_fnc_setRadioChannel;
} forEach _radio_ids;