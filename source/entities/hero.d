module entities.hero;

import entities.entity;
import components.component;
import components.healthComponent;
import systems.healthSystem;
import entities.entityType;
import components.componentType;

import std.stdio  : writeln, readln;
import std.string : chomp;

class Hero : Entity
{
	public this()
	{
		super([new HealthComponent(20, 20)], [HERO]);
	}

	override public void init()
	{
		writeln("Before we start, tell me your name.\n");
		string name = readln.chomp;
		writeln("Hello ", name, "! I hope you have fun in trying to survive in this horrible game.");
	}

	override public void update()
	{
		import std.stdio : readln, writeln;
		import std.string : chomp;
		import std.conv : to;
		writeln("Write 'die' to die.\n");
		switch (readln.chomp)
		{
			case "die":
				(to!(HealthComponent)(getComponent(HEALTH))).setCurHp(0);
				break;
			default:
		}
	}
}


unittest
{
	import std.conv : to;

	Entity hero = new Hero();

	assert(to!(HealthComponent)(hero.getComponent(HEALTH)).getCurHp == 20);
	assert(hero.getComponent(PICKABLE) is null);
}