package entities.movestates;

import entities.Entity;
import entities.Player;
import entities.movestates.MoveState.MovementStateEnum;
import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.util.FlxTimer;

/**
 * ...
 * @author Dave
 */
class PlayerGroundAttack extends MoveState 
{

	var ATTACK_LENGTH:Float = .3;
	var elapsedAttack:Float = 0;
	var attackTimer:FlxTimer;
	
	public function new(e:Entity) 
	{
		super(e);
		attackTimer = new FlxTimer();
	}
	
	override public function changeTo() 
	{
		var p:Player = cast entity;
		elapsedAttack = 0;
		p.animation.play('swing1');
		attackTimer.start(.1, function (_) {
			if (!p.flipX) {
				p.attack.flipX = false;
				p.attack.reset(p.x + 48, p.y-10);
				p.attack.initAttack(FlxPoint.weak(), .1, 'swing');
			}
			else {
				p.attack.flipX = true;
				p.attack.reset(p.x - 72, p.y -10);
				p.attack.initAttack(FlxPoint.weak(), .1, 'swing');
			}
			
		});
		
		//p.animation.play('slice');
	}

	override public function update(dt:Float) 
	{
		var p:Player = cast entity;
		p.velocity.x = 0;
		entity.animation.play('swing1');
		elapsedAttack += dt;
		if (elapsedAttack >= ATTACK_LENGTH)
			entity.changeMoveState(MovementStateEnum.GROUND);
		
	}
}