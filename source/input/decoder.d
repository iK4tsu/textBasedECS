module input.decoder;

import input.vocabulary;
import input.parser;
import game;
import entities.entityType;
import entities.hero;


import std.stdio  : writeln, write, readln;
import std.string : chomp, capitalize, tr;
import std.array  : join;
import std.conv   : to;

class Decoder
{
	public void processGameCommand(string _gameCommand)
	{
		final switch (to!(GameCommands)(_gameCommand))
		{
			case gameSTART:
				if (!game.isInitialized)
					game.initialize;
				else
					writeln("The game is already running!");
				break;

			case gameDIE:
				if (hero !is null)
					hero.setHp(0);
				else
					writeln("Sorry cannot do that.");
				break;

			case gameKILL:
				write("Are you sure you want to quit?");
				if (getInsurance)
					game.gameOver;
				break;

			case gameINSURANCE:
				getInsurance;
				break;

			case gamePRINT:
				writeln(capitalize(_gameCommand), " what?\n");
		}
	}

	public void processGameCommand(string _gameCommand, string[] _words)
	{
		switch (to!(GameCommands)(_gameCommand))
		{
			case gamePRINT:
				string s = _words.join(" ");
				writeln(s);
				break;
			default:
				writeln("Sorry but that command doesn't take parameters.\n");
		}
	}

	public void processVerb(string _verb)
	{
		final switch (to!(Verbs)(_verb))
		{
			case GO:
				writeln(capitalize(_verb), " where?");
				break;

			case PICK:
				writeln(tr(capitalize(_verb), "_", " "), " what?");
				break;

			case OPEN:
			case EAT:
				writeln(capitalize(_verb), " what?");
				break;
		}
	}

	private bool getInsurance()
	{
		writeln("(y/n)\n");
		switch (parser.parseToUpper(getInput))
		{
			case "YES":
			case "Y":
				return true;
			default:
				return false;
		}
	}

	public string getInput()
	{
		write("> ");
		return readln.chomp;
	}


	public this(Game _game)
	{
		game = _game;
		parser = new Parser(this);
	}

	public void setHero(Hero _hero)
	{
		if (hero is null)
		{
			hero = _hero;
			_hero.setDecoder(this);
		}
	}

	private Game game;
	private Hero hero;
	public Parser parser;
}