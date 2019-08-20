module game;

import entities.entity;
import systems.system;
import entities.hero;
import systems.healthSystem;
import preGameMenu;
import factory;

class Game
{
	private Entity[] entities;
	private System[] systems;
	private bool over;

	public this()
	{
		over = false;

	}

	public void init()
	{
		display();
		build(entities, systems);
		config(this);
		initAll(entities);
	}

	public void update()
	{
		import std.stdio : writeln;
		foreach(_entity; entities)
		{
			_entity.update;
		}

		foreach(_system; systems)
		{
			_system.update;
		}
	}

	public bool isOver() { return this.over; }

	public void gameOver() { this.over = true; }

	public Entity[] getEntities() { return entities; }
}


unittest
{
	Game g = new Game();
	g.gameOver;
	assert(g.isOver);
}