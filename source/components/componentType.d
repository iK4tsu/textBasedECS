module components.componentType;


const enum ComponentType : uint
{
	UNKOWN = 0,
	HEALTH,
	INVENTORY,
	PICKABLE
}

alias UNKOWN    = ComponentType.UNKOWN;
alias HEALTH    = ComponentType.HEALTH;
alias INVENTORY = ComponentType.INVENTORY;
alias PICKABLE  = ComponentType.PICKABLE;