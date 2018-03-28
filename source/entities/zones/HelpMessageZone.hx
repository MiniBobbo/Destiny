package entities.zones;

import entities.Entity;
import entities.Zone;
import flixel.FlxG;
import flixel.util.FlxColor;

/**
 * ...
 * @author Dave
 */
class HelpMessageZone extends Zone
{
	var message:String;
	
	public function new(X:Float, Y:Float, WIDTH:Float, HEIGHT:Float, message:String) 
	{
		super(X, Y, WIDTH, HEIGHT);
		makeGraphic(Std.int(WIDTH), Std.int(HEIGHT), FlxColor.TRANSPARENT, true);
		this.message = message;
	}
	
	
	override public function overlapEntity(entity:Entity, ?data:Dynamic) 
	{
		if (Std.is(entity, Player)) {
			H.ps.helpText.text = message;
			H.ps.helpText.visible = true;
		}

	}
}