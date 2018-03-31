package;

import entities.Attack;
import entities.EnemyFactory;
import entities.Entity;
import entities.Player;
import entities.Zone;
import entities.gameentites.Crystal;
import entities.gameentites.Enemy;
import entities.movestates.DeadState;
import entities.movestates.MoveState;
import entities.zones.DeathZone;
import entities.zones.HelpMessageZone;
import entities.zones.SignalZone;
import entities.zones.TravelZone;
import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.effects.particles.FlxEmitter;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import inputhelper.InputHelper;
import tmxtools.TmxRect;
import tmxtools.TmxTools;

class PlayState extends FlxState
{
	var maps:TmxTools;
	public var entities:FlxTypedGroup<Entity>;
	public var zones:FlxTypedGroup<Zone>;
	var rects:Array<TmxRect>;
	
	
	public var collision(default, null):FlxTilemap;
	var bg:FlxTilemap;
	var mg:FlxTilemap;
	var fg:FlxTilemap;
	public var player(default, null):Player;
	
	var emitter:FlxEmitter;
	var deflectSound:FlxSound;
	var dead:FlxSound;
	
	
	var enemies:FlxTypedGroup<Enemy>;
	var playerAttacks:FlxTypedGroup<Attack>;
	var enemyAttacks:FlxTypedGroup<Attack>;
	
	var timeInLevel:Float = 0;
	
	public var helpText(default, null):FlxText;
	
	var cover:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		
		H.setPlaystate(this);
		helpText = new FlxText(FlxG.width * .1, FlxG.height * .1, FlxG.width * .8, '', 16);
		helpText.visible = false;
		helpText.setFormat(null, 16, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE_FAST, FlxColor.BLACK);
		helpText.scrollFactor.set();
		maps = getMap();
		
		entities = new FlxTypedGroup<Entity>();
		enemies = new FlxTypedGroup<Enemy>();
		zones = new FlxTypedGroup<Zone>();
		playerAttacks= new FlxTypedGroup<Attack>();
		enemyAttacks = new FlxTypedGroup<Attack>();
		
		emitter = new FlxEmitter();
		emitter.makeParticles();
		
		deflectSound = FlxG.sound.load('assets/sounds/deflect.ogg');
		dead = FlxG.sound.load('assets/sounds/dead.ogg');
		collision = maps.getMap('collision');
		mg = maps.getMap('mg');
		fg= maps.getMap('fg');
		FlxG.worldBounds.set(collision.width, collision.height);
		FlxG.camera.bgColor = FlxColor.fromRGBFloat(.2,0,.2);
		rects = maps.getTmxRectanges();
		
		//FlxG.watch.add(helpText, 'visible');
		
		placeZones();
		
		
		bg = maps.getMap('bg');
		if (bg != null)
			add(bg);
		add(mg);
		collision.visible = true;
		
		playerAttacks.add(player.attack);
		
		FlxG.watch.add(playerAttacks.members, 'length', 'Player attacks');
		FlxG.watch.add(enemies.members, 'length', 'enemies');
		//FlxG.watch.add('Player attacks: ' + playerAttacks.countLiving());
		add(player);
		add(enemies);
		add(enemyAttacks);
		add(playerAttacks);
		add(emitter);
		if (fg != null)
			add(fg);

		add(helpText);
		add(zones);
		FlxG.camera.follow(player, FlxCameraFollowStyle.LOCKON, 1);
		FlxG.camera.setScrollBoundsRect(0, 0, collision.width, collision.height);
		
		FlxG.camera.fade(FlxColor.BLACK, .3, true);
		
		cover = new FlxSprite();
		cover.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK );
		cover.scrollFactor.set();
		FlxTween.tween(cover, {x:FlxG.width}, .3);
		add(cover);
		
	}

	private function createPlayer(r:TmxRect) {
		player = new Player(collision);
		entities.add(player);
		player.setBottom(r.r.bottom);
		player.x = r.r.x;
		
		//add(player);
	}
	
	override public function update(elapsed:Float):Void
	{
		timeInLevel += elapsed;
		helpText.visible = false;
		InputHelper.updateKeys(elapsed);
		FlxG.overlap(player, enemies, playerOverlapEntity);
		FlxG.overlap(playerAttacks, enemies, attackHits);
		FlxG.collide(enemyAttacks, collision, attackHitsMap);
		FlxG.overlap(enemyAttacks, player, attackHits);
		FlxG.overlap(player.attack, enemyAttacks, playerHitsAttack);
		if(timeInLevel > .5)
			FlxG.overlap(entities, zones, EntityOverlapZone);
		FlxG.collide(player, collision);
		//FlxG.collide(enemies, collision);
		super.update(elapsed);
	}
	
	public function attackHits(a:Attack, e:Entity) {
		if (a.ID != e.IDLastAttackHit)// && FlxG.pixelPerfectOverlap(a, e)) {
			e.signal('hit', a);
//		}
		
	}
	
	public function playerHitsAttack(pa:Attack, ea:Attack) {
		ea.kill();
		deflectSound.play();
		particles(FlxPoint.weak(ea.x + ea.width/2, ea.y + ea.height/2), ParticleTypes.SPARKLES, 10);

	}
	
	public function attackHitsMap(a:Attack, collision:FlxTilemap) {
		a.hitMap();
	}
	
	public function playerOverlapEntity(p:Player, e:Entity) {
		if (p.hp > 0 && (e.hp > 0 || e.hp == -1)) {
			p.overlapEntity(e);
			e.overlapEntity(p);
			
		}
	}
	
	public function EntityOverlapZone(e:Entity, z:Zone) {
		z.overlapEntity(e);
	}
	
	/**
	 * Lazy loads an enemy attack object.
	 * @return	A new or recycled attack object.
	 */
	public function getEnemyAttack():Attack {
		var a = enemyAttacks.getFirstAvailable();
		if (a == null) {
			a = new Attack();
			enemyAttacks.add(a);
		}
			
		return a;
	}
	
	private function placeZones() {
		for (r in rects) {
			//FlxG.log.add(r);
			switch (r.name) 
			{
				case 'd':
					if (r.properties.get('type') == H.gd.checkpoint){
						createPlayer(r);
					}
				case 'enemy':
					var enemy = EnemyFactory.createEnemy(r.properties.get('type'), r, collision);
					enemies.add(enemy);
					entities.add(enemy);
				case 'message':
					var m:HelpMessageZone = new HelpMessageZone(r.r.x, r.r.y, r.r.width, r.r.height, r.properties.get('type'));
					zones.add(m);
				case 'travel':
					var type:String = r.properties.get('type');
					var s = type.split('_');
					var t = new TravelZone(r.r.x, r.r.y, r.r.width, r.r.height, Std.parseInt(s[0]), s[1]);
					zones.add(t);
				case 'door':
					var d = EnemyFactory.createEnemy('door', r, collision);
					entities.add(d);
					enemies.add(d);
				case 'signal':
					var s = new SignalZone(r.r.x, r.r.y, r.r.width, r.r.height, r.properties.get('type'));
					zones.add(s);
				case 'crystal':
					var c = EnemyFactory.createEnemy('crystal', r, collision);
					entities.add(c);
					enemies.add(c);
				case 'sprite':
					var splitrects = H.rectToRects(r);
					for (i in splitrects) {
						var s = EnemyFactory.createEnemy(r.properties.get('type'), i, collision);
						entities.add(s);
						enemies.add(s);
					}
				case 'death':
					var d = new DeathZone(r.r.x, r.r.y, r.r.width, r.r.height);
					zones.add(d);
				default:
					trace( 'Problem with a zone.  ');
			}
		}
		
		if (player == null) {
			trace('Did not find a spot for the player in world ' + H.gd.world + ' checkpoint ' + H.gd.checkpoint);
			createPlayer(rects[0]);
		}
	}
	
	private function getMap() {
		if (H.gd.world == -2)
		return new TmxTools('assets/data/levels/monsterTest.tmx', 'assets/data/levels/');
		
		//switch (H.gd.world) 
		//{
			//case 1:
				//return new TmxTools('assets/data/levels/1.tmx', 'assets/data/levels/');
			//case 2:
				//return new TmxTools('assets/data/levels/2.tmx', 'assets/data/levels/');
			//case 3:
			//default:
				//return new TmxTools('assets/data/levels/1.tmx', 'assets/data/levels/');
//
		//}
	return new TmxTools('assets/data/levels/' + H.gd.world + '.tmx', 'assets/data/levels/');

	}
	
	/**
	 * Removes this state and creates a new one.  Used when traveling or when the player dies.
	 */
	public function resetState() {
		FlxG.camera.fade(FlxColor.BLACK, .2, false, function() {
			var s = new PlayState();
			FlxG.switchState(s);
			
		});
	}
	
	public function killPlayer() {
		player.animation.play('dead');
		player.changeMoveState(MovementStateEnum.DEAD);
		dead.play();
		FlxTween.tween(player, {alpha:0});
		FlxTween.color(player, .3, FlxColor.WHITE, FlxColor.RED);
		FlxTween.tween(cover, {x:0}, .3, {startDelay:1.5, onComplete:  function (_) {
				new FlxTimer().start(.5, function(_) {   H.ps.resetState(); });
		}});
	}
	
	public function particles(location:FlxPoint, type:ParticleTypes, count:Int = 1) {
		emitter.setPosition(location.x, location.y);
		emitter.velocity.set(10);
		emitter.lifespan.set(.5,1);
		emitter.velocity.set(-100,-100,100,100);
		emitter.start(true, .1, 15);
	
	}
}
