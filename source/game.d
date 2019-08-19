module game;

import entities.entity;
import systems.system;
import entities.hero;
import systems.healthSystem;
import preGameMenu;

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
		import systems.system;
		import systems.healthSystem;
		import entities.hero;
		Hero h = new Hero();
		HealthSystem s = new HealthSystem();

		this.entities ~= h;
		h.setGame(this);

		this.systems ~= s;

		h.addSystem([s]);
		s.addEntity(h);

		h.init();
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
}


unittest
{
	Game g = new Game();
	g.gameOver;
	assert(g.isOver);
}