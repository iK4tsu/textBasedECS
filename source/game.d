module game;

import entities.entity;
import systems.system;
import entities.hero;
import systems.healthSystem;
import preGameMenu;
import factory;
import input.decoder;

class Game
{
	private Entity[] entities;
	private System[] systems;
	private bool over;
	private bool initialized = false;
	public Decoder decoder;

	public this()
	{
		over = false;
		decoder = new Decoder(this);
	}

	public void init()
	{
		display(this);

		if (!isOver && isInitialized)
		{
			build(entities, systems);
			config(this);
			initAll(entities);
		}
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

	public const bool isOver() { return over; }

	public void gameOver() { over = true; }

	public Entity[] getEntities() { return entities; }

	public const bool isInitialized() { return initialized; }

	public void initialize() { initialized = true; }
}


unittest
{
	Game g = new Game();
	g.gameOver;
	assert(g.isOver);
}