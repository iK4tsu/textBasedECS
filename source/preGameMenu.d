module preGameMenu;

import std.stdio     : writeln, readln;
import std.string    : chomp;
import std.algorithm : cmp;

void display()
{
	writeln("Welcome to Search & Survive, the game where you have to be cautious about every decision you make");
	string res;

	do
	{
		writeln("Write 'start' to run the game\n");
		res = readln.chomp;
	} while(cmp("start", res));
}