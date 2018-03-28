package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

/**
 * ...
 * @author Dave
 */
class DeadState extends FlxState
{

	var ps:PlayState;

	override public function new(ps:PlayState) {
		super();
		this.ps = ps;
	}
	
	
	override public function create():Void 
	{
		super.create();
		var t:FlxText = new FlxText(0, 0, FlxG.width, H.gd + "\n" + ps.toString() , 12);
		add(t);
	}
	
}