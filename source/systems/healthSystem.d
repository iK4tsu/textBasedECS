module systems.healthSystem;


import systems.system;
import systems.systemType;

import components.component;
import components.healthComponent;
import components.componentType;

import entities.entity;
import entities.entityType;



import std.conv      : to;
import std.stdio     : writeln;
import std.algorithm : canFind;

class HealthSystem : System
{
	private HealthComponent health;

	public this()
	{
		super(HEALTH_S);
	}


	override public void update()
	{
		foreach(_entity; entities)
		{
			set(to!(HealthComponent)(_entity.getComponent(HEALTH)));

			if (health.isActive)
			{
				healthCheck(_entity);
			}
		}
	}

	private void set(HealthComponent _health) { health = _health; }
	private HealthComponent get() { return health; }

	public void healthCheck(Entity _entity)
	{
		if (canFind(_entity.getTypes, HERO) && health.getCurHp <= 0)
		{
			_entity.getGame.gameOver;
		}
		else if (health.getCurHp > health.getMaxHp)
		{
			health.setCurHp(health.getMaxHp);
		}
	}
}


unittest
{
	import components.healthComponent;

	HealthSystem health = new HealthSystem();
	HealthComponent hc = new HealthComponent(2, 20);

	health.set(hc);

	assert(health.get == hc);
}


unittest
{
	import entities.hero;
	import game;

	Hero hero = new Hero();
	HealthSystem health = new HealthSystem();
	Game _game = new Game();

	hero.addSystem(health);

	assert(hero.getSystem(HEALTH_S) == health);
	assert(canFind(health.getEntities, hero));

	(to!(HealthComponent)(hero.getComponent(HEALTH))).setCurHp(22);    // max health is 20 and current is 22

	assert((to!(HealthComponent)(hero.getComponent(HEALTH))).getCurHp == 22);

	health.update;                                                     // current health is set to 20

	assert((to!(HealthComponent)(hero.getComponent(HEALTH))).getCurHp == 20);

	hero.setGame(_game);

	(to!(HealthComponent)(hero.getComponent(HEALTH))).setCurHp(0);     // hero's current health is 0 but game continues

	assert((to!(HealthComponent)(hero.getComponent(HEALTH))).getCurHp == 0);
	assert(!_game.isOver);

	health.update;                                                     // now the game is over

	assert(_game.isOver);
}