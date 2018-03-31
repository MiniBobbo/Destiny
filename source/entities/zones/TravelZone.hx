package entities.zones;

import entities.Zone;
import flixel.FlxG;
import flixel.util.FlxColor;
import states.EndGameState;

/**
 * ...
 * @author Dave
 */
class TravelZone extends Zone
{
	var world:Int;
	var checkpoint:String;

	public function new(X:Float, Y:Float, WIDTH:Float, HEIGHT:Float, world:Int, checkpoint:String) 
	{
		super(X, Y, WIDTH, HEIGHT);
		makeGraphic(Std.int(WIDTH), Std.int(HEIGHT), FlxColor.TRANSPARENT);

		this.world = world;
		this.checkpoint = checkpoint;
	}
	
	override public function overlapEntity(entity:Entity, ?data:Dynamic) 
	{
		if (world == 8) {
			FlxG.switchState(new EndGameState() );
			return;
		}
		
		
		if (Std.is(entity, Player)) {
			H.gd.world = world;
			H.gd.checkpoint = checkpoint;
			H.ps.resetState();
		}
		
	}

	
}