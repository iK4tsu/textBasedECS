module entities.hero;

import entities.entity;
import components.component;
import components.healthComponent;
import systems.healthSystem;
import entities.entityType;
import components.componentType;
import input.decoder;

import std.stdio  : writeln, readln, write;
import std.string : chomp;
import std.conv   : to;

class Hero : Entity
{
	private Decoder decoder;

	public this()
	{
		super([new HealthComponent(20, 20)], [HERO]);
	}

	override public void init()
	{
		setDecoder(game.decoder);
		writeln("Before we start, tell me your name.\n");
		string name = getInput;
		writeln("Hello ", name, "! I hope you have fun in trying to survive in this horrible game.");
	}

	override public void update()
	{
		writeln("Write '\\die' to die.\n");
		decoder.parser.parseString(decoder.getInput);
	}

	public string getInput()
	{
		write("> ");
		return readln.chomp;
	}

	public void setDecoder(Decoder _decoder)
	{
		if (decoder is null)
		{
			decoder = _decoder;
			_decoder.setHero(this);
		}
	}

	public void setHp(int hp) { getHealthComponent.setCurHp(hp); }

	public HealthComponent getHealthComponent() { return to!(HealthComponent)(getComponent(HEALTH)); }
}


unittest
{
	import std.conv : to;

	Hero hero = new Hero();

	assert(hero.getHealthComponent.getCurHp == 20);
	assert(hero.getComponent(PICKABLE) is null);
}