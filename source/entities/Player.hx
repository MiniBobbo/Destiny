package entities;
import entities.attacks.Slice;
import entities.movestates.MoveState;
import entities.movestates.MoveState.MovementStateEnum;
import entities.movestates.PlayerAir;
import entities.movestates.PlayerCrouch;
import entities.movestates.PlayerGround;
import entities.movestates.PlayerGroundAttack;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;
import inputhelper.InputHelper;

/**
 * ...
 * @author Dave
 */
class Player extends Entity 
{
	var i = InputHelper;
	var GRAVITY:Float = 1200;
	
	
	public var attack(default, null):Slice;
	
	public function new(m:FlxTilemap) 
	{
		super(m);
		this.acceleration.y = 1200;
		frames = FlxAtlasFrames.fromTexturePackerJson('assets/images/mainAtlas.png', 'assets/images/mainAtlas.json');
		animation.addByPrefix('stand', 'knight_brea', 4);
		animation.addByPrefix('run', 'knight_run', 12);
		animation.addByPrefix('jumpup', 'knight_jumpup', 12, false);
		animation.addByPrefix('jumpdown', 'knight_jumpdown', 12, false);
		animation.addByPrefix('falling', 'knight_falling', 12, true);
		animation.addByPrefix('swing1', 'knight_swing1', 12, false);
		animation.addByPrefix('airswing', 'knight_airswing', 12, false);
		animation.play('stand');
		setSize(40, 50);
		centerOffsets();
		origin.y = 192;
		origin.x = 96;
		offset.y += 68;
		
		ID = 99;
		
		attack = new Slice();
		
		//offset.x = (100 - width) / 2;
		addMoveStateToMap(MovementStateEnum.GROUND, new PlayerGround(this));
		addMoveStateToMap(MovementStateEnum.AIR, new PlayerAir(this));
		addMoveStateToMap(MovementStateEnum.CROUCHING, new PlayerCrouch(this));
		addMoveStateToMap(MovementStateEnum.ATTACKING, new PlayerGroundAttack(this));
		changeMoveState(MovementStateEnum.GROUND);
		FlxG.watch.add(this, 'currentMoveEnum');
		FlxG.watch.add(this, 'velocity');
	}
	
	public function registerAttack(a:Slice) {
		this.attack = a;
	}
	
	
	override public function update(elapsed:Float):Void 
	{
		//Shortcut to reduce my typing.  InputHelpier is awkward to type over and over...
		var i = InputHelper;

		velocity.x = 0;
		
		if (!H.allowInput) {
			return;
		}
		
		if (currentMoveState != null)
			currentMoveState.update(elapsed);
		if (velocity.x > 0)
			flipX = false;
		if (velocity.x < 0)
			flipX = true;
		super.update(elapsed);

	}
	
	/**
	 * Sets the bottom of the player's hitbox on the specified y level.
	 * @param	floor
	 */
	public function setBottom(floor:Float) {
		y = floor - height;
	}
	
}