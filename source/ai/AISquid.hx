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
	var SQUID_STEP_TIME:Float = .3;
	var updateIn:Float;
	
	public function new(ent:Entity) 
	{
		super(ent);
		
	}
	
	override public function changeTo() 
	{
		super.changeTo();
		e.maxVelocity.set(SQUID_SPEED, SQUID_SPEED);
		e.animation.play('follow');
		updateIn = SQUID_STEP_TIME;
	}
	
	override public function update(dt:Float) 
	{
		super.update(dt);
		updateIn -= dt;
		if (updateIn > 0)
		return;
		updateIn = SQUID_STEP_TIME;
		
		var accel:FlxPoint = FlxPoint.get(0, -SQUID_ACCELERATION);
		accel.rotate(FlxPoint.weak(), e.getMidpoint().angleBetween(H.ps.player.getMidpoint()));
		e.acceleration.copyFrom(accel);
		accel.put();
	}
	
}