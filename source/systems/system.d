module systems.system;

import entities.entity; 
import components.component;
import systems.systemType;


import std.algorithm : canFind;

class System
{
	protected Entity[] entities;
	protected const SystemType type;


	public this(SystemType _type)
	{
		type = _type;
	}


	public void update()
	{
		
	}


	public void addEntity(Entity _entity)
	{
		if (!canFind(entities, _entity))
		{
			entities ~= _entity;
			_entity.addSystem(this);
		}
	}

	public Entity[] getEntities() { return entities.dup; }


	public const SystemType getType() { return type;}
}


unittest
{
	import entities.hero;
	import components.healthComponent;
	import systems.healthSystem;
	import components.componentType;

	import std.conv : to;

	Hero _hero = new Hero();
	HealthSystem _health = new HealthSystem();

	_hero.addSystem(_health);

	(to!(HealthComponent)(_hero.getComponent(HEALTH))).setCurHp(22);    // current health > max health == 20

	_health.update;                                                     // component active, system updates

	assert((to!(HealthComponent)(_hero.getComponent(HEALTH))).getCurHp == 20);

	(to!(HealthComponent)(_hero.getComponent(HEALTH))).setCurHp(22);    // current health > max health == 20
	_hero.turnOffComponent(HEALTH);                                     // component isn't active

	_health.update;                                                     // system does not update

	assert((to!(HealthComponent)(_hero.getComponent(HEALTH))).getCurHp == 22);
}