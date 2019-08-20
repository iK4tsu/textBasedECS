module input.parser;

import input.vocabulary;
import input.decoder;


import std.array     : split;
import std.uni       : toUpper;
import std.conv      : to;
import std.algorithm : cmp;
import std.string    : tr;
import std.traits;

class Parser
{
	void parseGameCommands(string[] _gameCommands)
	{
		string gc = parseToUpper(_gameCommands[0]);

		foreach(_command; (__traits(allMembers, GameCommands)))
		{
			string cts = to!(string)(_command);
			if (cts.split("_").length == 1)
			{
				//cts = tr(cts, "_", " ");
				cts = '\\' ~ cts;

				assert(cts[0] == '\\');

				if (cmp(cts, gc) == 0)
				{
					if (_gameCommands.length == 1)
						decoder.processGameCommand(_command);
					else
						decoder.processGameCommand(_command, _gameCommands[1 .. $]);
					return;
				}
			}
		}
	}

	string[] parserSplitter(string command)
	{
		return command.split;
	}

	string parseToUpper(string _word)
	{
		string ret;
		foreach(c; _word)
		{
			ret ~= c.toUpper;
		}
		return ret;
	}


	public this(Decoder _decoder)
	{
		decoder = _decoder;
	}

	private Decoder decoder;
}