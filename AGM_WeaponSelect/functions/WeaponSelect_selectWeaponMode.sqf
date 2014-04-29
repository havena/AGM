// by commy2

private ["_weapon", "_muzzles", "_modes", "_count", "_index", "_muzzle", "_mode"];

_weapon = _this;
if (_weapon == "") exitWith {};

if (currentWeapon player != _weapon) exitWith {
	player selectWeapon _weapon;
};

_muzzles = _weapon call AGM_WeaponSelect_getWeaponMuzzles;	
_modes = _weapon call AGM_WeaponSelect_getWeaponModes;

_count = count _modes;
_index = (_modes find currentWeaponMode player) + 1;
if (_index > _count - 1) then {_index = 0};

_muzzle = _muzzles select 0;
_mode = _modes select _index;

_index = 0;
while {
	_index < 100 && {currentMuzzle player != _muzzle || {currentWeaponMode player != _mode}}
} do {
	player action ["SwitchWeapon", vehicle player, vehicle player, _index];
	_index = _index + 1;
};
