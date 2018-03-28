package entities.zones;

import entities.Entity;
import entities.Zone;
import flixel.util.FlxColor;

/**
 * ...
 * @author Dave
 */
class SignalZone extends Zone 
{
	var sendSignal:String;
	public function new(X:Float, Y:Float, WIDTH:Float, HEIGHT:Float, sendSignal:String) 
	{
		super(X, Y, WIDTH, HEIGHT);
		makeGraphic(Std.int(width), Std.int(height), FlxColor.TRANSPARENT);
		this.sendSignal = sendSignal;
	}
	
	override public function overlapEntity(entity:Entity, ?data:Dynamic) 
	{
		if (Std.is(entity, Player)) {
			H.signalAll(sendSignal);
			kill();
			trace('Signaling all OPEN');
		}
	}
	
}