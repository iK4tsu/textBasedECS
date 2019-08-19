module app;

import game;

void main()
{
	Game game = new Game();
	game.init;
	do
	{
		game.update;
	} while(!game.isOver);

	import std.stdio : writeln;
	writeln("Thank you for playing!");
}