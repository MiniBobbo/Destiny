package ai;

import entities.Attack;
import entities.Entity;
import entities.Player;
import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.util.FlxTimer;



/**
 * ...
 * @author Dave
 */
class AIMinion extends AI 
{
	var p:Player;
	
	var ATTACK_LENGTH:Float = 100;
	var SENSE_DISTANCE:Float = 400;
	
	var attacking:Bool = false;
	var attack:Attack;
	var elapsedAttack:Float;
	var ATTACK_TIME:Float = 1;
	var PREP_TIME:Float = .3;
	
	var prepTimer:FlxTimer;
	var attackTimer:FlxTimer;
	
	
	public function new(ent:Entity) 
	{
		super(ent);
		prepTimer = new FlxTimer();
		attackTimer = new FlxTimer();
	}

	override public function changeTo() 
	{
		e.animation.play('angry');
		e.maxVelocity.set(400, 1000);
		p = H.ps.player;
		attacking = false;
	}
	
	override public function changeFrom() 
	{
		attackTimer.cancel();
		prepTimer.cancel();
	}
	override public function update(dt:Float) 
	{
		e.acceleration.x = 0;
		if (attacking)
			return;
		
		if (p.x < e.x)
			e.flipX = true;
		else
			e.flipX = false;
			
		var distance = H.distanceBetween(e,p);
		if (distance > ATTACK_LENGTH) {
			e.animation.play('angrymove');
			e.acceleration.x = 1000;
			if (e.flipX)
			e.acceleration.x *= -1;
		} 
		else if (distance > SENSE_DISTANCE) {
			e.animation.play('stand');
			e.changeAIState(AIState.PASSIVE);
		} else {
			prepAttack();
		}
	}
	
	private function prepAttack() {
		attacking = true;
		e.animation.play('swingready');
		prepTimer.start(PREP_TIME, makeAttack);
	}
	
	private function makeAttack(_) {
		e.animation.play('swingsword');
		attack = H.ps.getEnemyAttack();
		if (!e.flipX) {
			attack.flipX = false;
			attack.reset(e.x + 52, e.y-112);
			attack.initAttack(FlxPoint.weak(), .2, 'swing');
		}
		else {
			attack.flipX = true;
			attack.reset(e.x - 212, e.y-112);
			attack.initAttack(FlxPoint.weak(), .2, 'swing');
		}
		attackTimer.start(ATTACK_TIME, function (_) {attacking = false; });
		
	}
}