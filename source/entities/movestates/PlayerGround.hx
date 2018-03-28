package entities.movestates;

import entities.Entity;
import entities.movestates.MoveState.MovementStateEnum;
import flixel.FlxObject;
import inputhelper.InputHelper;

/**
 * ...
 * @author Dave
 */
class PlayerGround extends MoveState 
{
	var RUN_SPEED:Float = 500;
	
	public function new(e:Entity) 
	{
		super(e);
		
	}
	
	override public function update(dt:Float) 
	{
		var i = InputHelper;
		entity.velocity.x = 0;
		
		if (i.isButtonJustPressed('attack')) {
			entity.changeMoveState(MovementStateEnum.ATTACKING);
		}
		
		if (i.isButtonPressed('down'))
			entity.changeMoveState(MovementStateEnum.CROUCHING);
		
		if (i.isButtonPressed('left')) {
			entity.animation.play('run');
			entity.velocity.x -= RUN_SPEED; 
		}
		if (i.isButtonPressed('right')) {
			entity.animation.play('run');
			entity.velocity.x += RUN_SPEED; 
		}
		if (!i.isButtonPressed('right') && !i.isButtonPressed('left') ) {
			entity.animation.play('stand');
		}
		
		if (i.isButtonJustPressed('jump') || !entity.isTouching(FlxObject.FLOOR)) {
			entity.y -= .3;
			entity.velocity.y = 0;
			entity.changeMoveState(MovementStateEnum.AIR);
		}
		
		
		//if(i.isButtonJustPressed('jump'))
	}
	
}