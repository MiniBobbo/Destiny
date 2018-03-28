package entities.attacks;

import entities.Attack;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

/**
 * ...
 * @author Dave
 */
class Slice extends Attack 
{

	public function new(lifespan:Float=.2) 
	{
		super(lifespan);
		visible = false;
		//offset.y += 128;
	}
	
	
	
}