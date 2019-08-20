module factory;

import entities.entity;
import systems.system;
import components.component;

import entities.entityType;
import systems.systemType;
import components.componentType;

import game;

void build(ref Entity[] _entities, ref System[] _systems)
{
	/********************************************************************************************************************/
	/*                                                    Systems                                                       */
	/********************************************************************************************************************/


	/*
	 * Health System
	 */

	import systems.healthSystem;

	HealthSystem healthS = new HealthSystem();


	/*
	 * Inventory System
	 */

	import systems.inventorySystem;

	InventorySystem inventoryS = new InventorySystem();


	/*
	 * TODO SYSTEMS
	 */


	_systems = [ healthS,
				inventoryS
				];



	/********************************************************************************************************************/
	/*                                                   Entities                                                       */
	/********************************************************************************************************************/


	/*
	 * Hero
	 *
	 *
	 * When built, this entity automaticaly creates the follow up components:
	 *
	 *    > Health Component
	 *    > Inventory Component
	 *    > TODO ADD COMPONENTS
	 *
	 *
	 * As a hero, this entity needs this systems:
	 *
	 *    > Health System
	 *    > TODO ADD SYSTEMS
	 */

	import entities.hero;

	Hero hero = new Hero();

	hero.addSystem(healthS);

	assert(hero.getTypes[0] == HERO);


	/*
	 * TODO ENTITIES
	 */


	_entities ~= [ hero
				  ];
}


void config(Game _game)
{
	foreach(_entity; _game.getEntities)
	{
		_entity.setGame(_game);
	}
}


void initAll(Entity[] _entities)
{
	foreach(_entity; _entities)
	{
		_entity.init();
	}
}


unittest
{
	Entity[] e;
	System[] s;

	build(e, s);

	assert(e[0].getTypes[0] == HERO);
	assert(s[0].getType == HEALTH_S);
}