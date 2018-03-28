package ai;

import entities.Entity;
import flixel.math.FlxPoint;

/**
 * ...
 * @author Dave
 */
class AISquid extends AI 
{

	var SQUID_SPEED:Float = 500;
	var SQUID_ACCELERATION:Float = 300;
	
	public function new(ent:Entity) 
	{
		super(ent);
		
	}
	
	override public function changeTo() 
	{
		super.changeTo();
		e.maxVelocity.set(SQUID_SPEED, SQUID_SPEED);
		e.animation.play('follow');
	}
	
	override public function update(dt:Float) 
	{
		super.update(dt);
		var accel:FlxPoint = FlxPoint.get(0, -SQUID_ACCELERATION);
		accel.rotate(FlxPoint.weak(), e.getMidpoint().angleBetween(H.ps.player.getMidpoint()));
		e.acceleration.copyFrom(accel);
		accel.put();
	}
	
}