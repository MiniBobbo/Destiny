package entities.movestates;

import entities.Entity;

/**
 * ...
 * @author Dave
 */
class PlayerAirAttack extends MoveState 
{

	
	var lastVelocity:Float;
	
	public var JUMP_STRENGTH(default, null):Int = 500;
	public var JUMP_FALL_STRENGTH(default, null):Int = 800;
	public var JUMP_TIME(default, null):Float = .34;
	public var JUMP_SPEED(default, null):Float = 350;
	
	var jumpElapsed:Float = 0;
	
	public function new(e:Entity) 
	{
		super(e);
	}
	
	override public function changeTo() 
	{
		jumpElapsed = 0;
		lastVelocity = 0;
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
			
		if (entity.velocity.y < 0 && entity.animation.name != 'jumpup') {
			entity.animation.play('jumpup');
			entity.scale.x = .8;
			entity.scale.y = 1.3;
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
}