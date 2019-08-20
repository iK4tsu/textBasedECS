module preGameMenu;

import game;

import std.stdio     : writeln, readln;
import std.string    : chomp;
import std.algorithm : cmp;

void display(Game _game)
{
	writeln("Welcome to Search & Survive, the game where you have to be cautious about every decision you make");
	string res;

	do
	{
		writeln("Write '\\start' to run the game\n");
		_game.decoder.parser.parseGameCommands(_game.decoder.parser.parserSplitter(_game.decoder.getInput));
	} while(!_game.isInitialized && !_game.isOver);

}