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
}