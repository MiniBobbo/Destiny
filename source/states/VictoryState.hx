package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * ...
 * @author Dave
 */
class VictoryState extends FlxState
{

	public function new() 
	{
		super();
		
	}

	var victoryText:FlxText;
	override public function create():Void 
	{
		super.create();
		FlxG.camera.fade(FlxColor.WHITE, 1, true);
		victoryText = new FlxText(0, 10, 400, 'Gem recovered, you travel back where the wise man is able to make the potion to heal your son.\n  Or maybe you trade it for a bigger club.  The story got cut for time, so imagine what you would like.  \n\n Sorry for the disappointing victory screen.', 20);
		
		add(victoryText);
	}
	
}