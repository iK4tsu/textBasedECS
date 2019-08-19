module entities.entityType;


const enum EntityType : uint
{
	UNKOWN = 0,
	HERO,
	ENEMY,
	OBJECT,
	FOOD,
	STACKABLE,
	ROOM
}

alias UNKOWN    = EntityType.UNKOWN;
alias HERO      = EntityType.HERO;
alias ENEMY     = EntityType.ENEMY;
alias OBJECT    = EntityType.OBJECT;
alias FOOD      = EntityType.FOOD;
alias STACKABLE = EntityType.STACKABLE;
alias ROOM      = EntityType.ROOM;