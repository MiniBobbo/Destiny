package;

import flixel.FlxGame;
import inputhelper.InputHelper;
import openfl.display.Sprite;
import states.EndGameState;

class Main extends Sprite
{
	public function new()
	{
		super();
		
		InputHelper.init();
		InputHelper.allowArrowKeys();
		InputHelper.allowWASD();
		InputHelper.addButton('jump');
		InputHelper.addButton('attack');
		InputHelper.addButton('pause');
		InputHelper.assignKeyToButton('Z','attack');
		InputHelper.assignKeyToButton('K','attack');
		InputHelper.assignKeyToButton('L','jump');
		InputHelper.assignKeyToButton('X','jump');
		
		H.gd = {
			flags:[false,false,false],
			world:6,
			checkpoint:'5',
			maxHealth:5,
			saveWorld:1, 
			saveCheckpoint:'start'
		};

		
		addChild(new FlxGame(0, 0, PlayState));
	}
}
