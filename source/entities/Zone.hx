package entities;
import entities.Entity;
import flixel.FlxSprite;

/**
 * ...
 * @author Dave
 */
class Zone extends FlxSprite
{

	public function new(X:Float, Y:Float, WIDTH:Float, HEIGHT:Float) 
	{
		super();
		x = X;
		y = Y;
		width = WIDTH;
		height = HEIGHT;
		
		
	}
	
	public function overlapEntity(entity:Entity, ?data:Dynamic) 
	{

	}
	
}