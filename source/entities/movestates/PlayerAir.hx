package entities.movestates;

import entities.Entity;
import entities.Player;
import entities.movestates.MoveState.MovementStateEnum;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.math.FlxPoint;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import inputhelper.InputHelper;

/**
 * ...
 * @author Dave
 */
class PlayerAir extends MoveState 
{
	
	var lastVelocity:Float;
	
	public var JUMP_STRENGTH(default, null):Int = 500;
	public var JUMP_FALL_STRENGTH(default, null):Int = 800;
	public var JUMP_TIME(default, null):Float = .34;
	public var JUMP_SPEED(default, null):Float = 350;
	
	var attacking:Bool = false;
	var attackingTimer:FlxTimer;
	
	var jumpElapsed:Float = 0;
	
	public function new(e:Entity) 
	{
		super(e);
		FlxG.watch.add(this, 'jumpElapsed', 'Player Jump Elapsed');
		attackingTimer = new FlxTimer();
	}
	
	override public function changeTo() 
	{
		jumpElapsed = 0;
		lastVelocity = 0;
		attacking = false;
		
	}
	
	override public function changeFrom() 
	{
		attackingTimer.cancel();
	}
	
	override public function update(dt:Float) 
	{
		var i = InputHelper;

		
		jumpElapsed += dt;
		if (entity.isTouching(FlxObject.FLOOR)) {
			entity.scale.x = 1.2;
			entity.scale.y = .8;
			FlxTween.tween(entity.scale, {x:1, y:1}, .2);
			entity.changeMoveState(MovementStateEnum.GROUND);
			return;
		}
		
		if (i.isButtonPressed('left')) 
			entity.velocity.x -= JUMP_SPEED; 
		if (i.isButtonPressed('right')) 
			entity.velocity.x += JUMP_SPEED; 
		if (i.isButtonPressed('jump') && !entity.isTouching(FlxObject.CEILING) && jumpElapsed <= JUMP_TIME) {
			entity.maxVelocity.y = JUMP_STRENGTH;
			entity.velocity.y = -JUMP_STRENGTH;
		} else {
			entity.maxVelocity.y = JUMP_FALL_STRENGTH;
			jumpElapsed = JUMP_TIME +1;
			
		}
		var currentVelocity:Float = entity.velocity.y;
		
		//Animation section
		if (i.isButtonJustPressed('attack') && !attacking) {
			launchAttack();				
		}
		
		if (attacking) {
			var p:Player = cast entity;
			var a = p.attack;
			if (!p.flipX) {
				a.setPosition(p.x + 40, p.y - 10);
			} else
				a.setPosition(p.x - 64, p.y - 10);
			
			return;
		}
		
		if (entity.velocity.y < 0 && entity.animation.name != 'jumpup') {
			if (entity.animation.name != 'airswing') {
				entity.scale.x = .8;
				entity.scale.y = 1.3;
			}
			entity.animation.play('jumpup');
			
			FlxTween.tween(entity.scale, {x:1, y:1}, .2);
		}
		else if (entity.animation.name == 'jumpup' && entity.velocity.y > 0)
		entity.animation.play('jumpdown');
		else if (entity.animation.name == 'jumpdown' && entity.animation.finished) {
			entity.animation.play('falling');
		} else if( entity.velocity.y > 0 && entity.animation.name != 'jumpdown'){
			
			entity.animation.play('falling');
		}

	}
	
	private function launchAttack() {
		attacking = true;
		var p:Player = cast entity;
		p.animation.play('airswing');
		if (!p.flipX) {
			p.attack.flipX = false;
			p.attack.reset(p.x + 48, p.y-10);
			p.attack.initAttack(FlxPoint.weak(), .2, 'swing');
		}
		else {
			p.attack.flipX = true;
			p.attack.reset(p.x - 72, p.y -10);
			p.attack.initAttack(FlxPoint.weak(), .2, 'swing');
		}
		attackingTimer.start(.3, function(_) {attacking = false; } );
	}
}