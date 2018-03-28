package ai;

import entities.Attack;
import entities.Entity;
import entities.Player;
import flixel.math.FlxPoint;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

/**
 * ...
 * @author Dave
 */
class AIXBowMinion extends AI 
{
	var p:Player;
	
	var ATTACK_LENGTH:Float = 1000;
	var SENSE_DISTANCE:Float = 1000;
	
	var attacking:Bool = false;
	var attack:Attack;
	var elapsedAttack:Float;
	var ATTACK_TIME:Float = 1;
	var AIM_TIME:Float = .5;
	var RELOAD_TIME:Float = 3;
	var PREP_TIME:Float = .2;
	var SHOT_SPEED:Float = 600;
	var SHOT_LIFESPAN:Float = 6;
	
	var prepTimer:FlxTimer;
	var attackTimer:FlxTimer;
	var aimTimer:FlxTimer;
	
	var LOSE_INTEREST_TIME:Float = 3;
	var timeSinceLastAttack:Float;
	
	public function new(ent:Entity) 
	{
		super(ent);
		prepTimer = new FlxTimer();
		attackTimer = new FlxTimer();
		aimTimer = new FlxTimer();
		
		
	}

	override public function changeTo() 
	{
		e.animation.play('fire');
		e.maxVelocity.set(400, 1000);
		p = H.ps.player;
		attacking = false;
		timeSinceLastAttack = LOSE_INTEREST_TIME;
	}
	
	override public function changeFrom() 
	{
		attackTimer.cancel();
		prepTimer.cancel();
		aimTimer.cancel();
	}
	override public function update(dt:Float) 
	{
		timeSinceLastAttack -= dt;
		e.acceleration.x = 0;
		
		if (p.x < e.x)
			e.flipX = true;
		else
			e.flipX = false;
		
		if (timeSinceLastAttack <= 0 && !attacking) {
			var distance = H.distanceBetween(e,p);
			if (distance > ATTACK_LENGTH) {
				timeSinceLastAttack = ATTACK_TIME;
				return;
			}
			prepAttack();

		}
	}
	
	private function prepAttack() {
		attacking = true;
		e.animation.play('fire');
		aimTimer.start(AIM_TIME, function(_) { e.scale.x = .8;	fireBullet(); FlxTween.tween(e.scale, {x:1}, .2); } );
		
		
				
		prepTimer.start(PREP_TIME + AIM_TIME, reload);
	}
	
	private function reload(_) {
		e.animation.play('reload');
		attackTimer.start(RELOAD_TIME, function (_) {attacking = false; e.releaseAttack(); e.animation.play('fire'); });
		
	}
	
	private function fireBullet() {
		var s = H.ps.getEnemyAttack();
		var shotVel = FlxPoint.get(0, -SHOT_SPEED);
		shotVel.rotate(FlxPoint.weak(), e.getMidpoint().angleBetween(H.ps.player.getMidpoint()));
		s.initAttack(shotVel, SHOT_LIFESPAN, 'ball');
		s.reset(e.x + 10, e.y + 10);
	}
}