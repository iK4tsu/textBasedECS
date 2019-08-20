module input.vocabulary;


enum GameCommands : uint
{
	START      = 0,
	INIT       = 0,
	BEGIN      = 0,
	DIE        = 1,
	SUICIDE    = 1,
	KILLMYSELF = 1,
	KILL       = 2,
	QUIT       = 2,
	INSURANCE  = 3,
	TELL       = 4,
	PRINT      = 4,
	SAY        = 4,
	ECHO       = 4
}

alias gameSTART     = GameCommands.START;
alias gameDIE       = GameCommands.DIE;
alias gameKILL      = GameCommands.KILL;
alias gameINSURANCE = GameCommands.INSURANCE;
alias gamePRINT     = GameCommands.PRINT;