package entities.movestates;

import entities.Entity;
import entities.movestates.MoveState.MovementStateEnum;
import inputhelper.InputHelper;

/**
 * ...
 * @author Dave
 */
class PlayerCrouch extends MoveState 
{

	public function new(e:Entity) 
	{
		super(e);
	}
	
	override public function changeTo() 
	{
		entity.shrinkHitboxY();
	}
	
	override public function changeFrom() 
	{
		entity.restoreHitboxY();
	}
	
	override public function update(dt:Float) 
	{
		if (!InputHelper.isButtonPressed('down'))
			entity.changeMoveState(MovementStateEnum.GROUND);
		
	}
	
}