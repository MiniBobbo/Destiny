package ai;
import entities.Entity;
import entities.Player;
import flixel.FlxG;
import flixel.math.FlxPoint;

/**
 * ...
 * @author Dave
 */
class AIDetect extends AI
{
	var step:Float = 1;
	var STEP_VALUE:Float = .5;
	public var SIGHT_DISTANCE:Float = 350;
	
	override public function update(dt:Float) 
	{
		step -= dt;
		if (step > 0)
			return;
		step = STEP_VALUE;
		if (FlxG.random.bool(5))
			e.flipX = !e.flipX;
		var p:Player = H.ps.player;
		if ((!e.flipX && p.x > e.x) || (e.flipX && p.x < e.x) ) {
			var rayHit:Bool = e.collisionMap.ray(e.getPosition(), p.getPosition()); 
			
			if(rayHit && H.distanceBetween(e,p) < SIGHT_DISTANCE) {
				e.changeAIState(AIState.ACTIVE);
				
			}
		} 
	}
}