module systems.systemType;


const enum SystemType : uint
{
	UNKOWN = 0,
	HEALTH,
	INVENTORY
}

alias UNKOWN    = SystemType.UNKOWN;
alias HEALTH_S    = SystemType.HEALTH;
alias INVENTORY_S = SystemType.INVENTORY;