module app;

import game;

void main()
{
	Game game = new Game();
	game.init;
	do
	{
		game.update;
	} while(!game.isOver && game.isInitialized);

	import std.stdio : writeln;
	writeln("Thank you for playing!");
}