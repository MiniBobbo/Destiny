package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		
		
		#end
		
		#if flash
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/data/levels/0.tmx", __ASSET__assets_data_levels_0_tmx);
		type.set ("assets/data/levels/0.tmx", AssetType.TEXT);
		className.set ("assets/data/levels/1.tmx", __ASSET__assets_data_levels_1_tmx);
		type.set ("assets/data/levels/1.tmx", AssetType.TEXT);
		className.set ("assets/data/levels/2.tmx", __ASSET__assets_data_levels_2_tmx);
		type.set ("assets/data/levels/2.tmx", AssetType.TEXT);
		className.set ("assets/data/levels/3.tmx", __ASSET__assets_data_levels_3_tmx);
		type.set ("assets/data/levels/3.tmx", AssetType.TEXT);
		className.set ("assets/data/levels/32blocks.png", __ASSET__assets_data_levels_32blocks_png);
		type.set ("assets/data/levels/32blocks.png", AssetType.IMAGE);
		className.set ("assets/data/levels/32Blocks.tsx", __ASSET__assets_data_levels_32blocks_tsx);
		type.set ("assets/data/levels/32Blocks.tsx", AssetType.TEXT);
		className.set ("assets/data/levels/4.tmx", __ASSET__assets_data_levels_4_tmx);
		type.set ("assets/data/levels/4.tmx", AssetType.TEXT);
		className.set ("assets/data/levels/5.tmx", __ASSET__assets_data_levels_5_tmx);
		type.set ("assets/data/levels/5.tmx", AssetType.TEXT);
		className.set ("assets/data/levels/50blocks.png", __ASSET__assets_data_levels_50blocks_png);
		type.set ("assets/data/levels/50blocks.png", AssetType.IMAGE);
		className.set ("assets/data/levels/6.tmx", __ASSET__assets_data_levels_6_tmx);
		type.set ("assets/data/levels/6.tmx", AssetType.TEXT);
		className.set ("assets/data/levels/64blocks.png", __ASSET__assets_data_levels_64blocks_png);
		type.set ("assets/data/levels/64blocks.png", AssetType.IMAGE);
		className.set ("assets/data/levels/7.tmx", __ASSET__assets_data_levels_7_tmx);
		type.set ("assets/data/levels/7.tmx", AssetType.TEXT);
		className.set ("assets/data/levels/castle.png", __ASSET__assets_data_levels_castle_png);
		type.set ("assets/data/levels/castle.png", AssetType.IMAGE);
		className.set ("assets/data/levels/finalRoom.tmx", __ASSET__assets_data_levels_finalroom_tmx);
		type.set ("assets/data/levels/finalRoom.tmx", AssetType.TEXT);
		className.set ("assets/data/levels/monsterTest.tmx", __ASSET__assets_data_levels_monstertest_tmx);
		type.set ("assets/data/levels/monsterTest.tmx", AssetType.TEXT);
		className.set ("assets/data/levels/stonetileset.png", __ASSET__assets_data_levels_stonetileset_png);
		type.set ("assets/data/levels/stonetileset.png", AssetType.IMAGE);
		className.set ("assets/data/levels/test3.tmx", __ASSET__assets_data_levels_test3_tmx);
		type.set ("assets/data/levels/test3.tmx", AssetType.TEXT);
		className.set ("assets/data/levels/testlevel.tmx", __ASSET__assets_data_levels_testlevel_tmx);
		type.set ("assets/data/levels/testlevel.tmx", AssetType.TEXT);
		className.set ("assets/data/levels/testlevel2.tmx", __ASSET__assets_data_levels_testlevel2_tmx);
		type.set ("assets/data/levels/testlevel2.tmx", AssetType.TEXT);
		className.set ("assets/images/32blocks.png", __ASSET__assets_images_32blocks_png);
		type.set ("assets/images/32blocks.png", AssetType.IMAGE);
		className.set ("assets/images/heroleap.png", __ASSET__assets_images_heroleap_png);
		type.set ("assets/images/heroleap.png", AssetType.IMAGE);
		className.set ("assets/images/herostand.png", __ASSET__assets_images_herostand_png);
		type.set ("assets/images/herostand.png", AssetType.IMAGE);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/main.png", __ASSET__assets_images_main_png);
		type.set ("assets/images/main.png", AssetType.IMAGE);
		className.set ("assets/images/mainAtlas.json", __ASSET__assets_images_mainatlas_json);
		type.set ("assets/images/mainAtlas.json", AssetType.TEXT);
		className.set ("assets/images/mainAtlas.png", __ASSET__assets_images_mainatlas_png);
		type.set ("assets/images/mainAtlas.png", AssetType.IMAGE);
		className.set ("assets/images/portraits.json", __ASSET__assets_images_portraits_json);
		type.set ("assets/images/portraits.json", AssetType.TEXT);
		className.set ("assets/images/portraits.png", __ASSET__assets_images_portraits_png);
		type.set ("assets/images/portraits.png", AssetType.IMAGE);
		className.set ("assets/images/titlebg.png", __ASSET__assets_images_titlebg_png);
		type.set ("assets/images/titlebg.png", AssetType.IMAGE);
		className.set ("assets/images/titlefg.png", __ASSET__assets_images_titlefg_png);
		type.set ("assets/images/titlefg.png", AssetType.IMAGE);
		className.set ("assets/music/mainloop.ogg", __ASSET__assets_music_mainloop_ogg);
		type.set ("assets/music/mainloop.ogg", AssetType.MUSIC);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/dead", __ASSET__assets_sounds_dead);
		type.set ("assets/sounds/dead", AssetType.BINARY);
		className.set ("assets/sounds/dead.ogg", __ASSET__assets_sounds_dead_ogg);
		type.set ("assets/sounds/dead.ogg", AssetType.SOUND);
		className.set ("assets/sounds/deflect", __ASSET__assets_sounds_deflect);
		type.set ("assets/sounds/deflect", AssetType.BINARY);
		className.set ("assets/sounds/deflect.ogg", __ASSET__assets_sounds_deflect_ogg);
		type.set ("assets/sounds/deflect.ogg", AssetType.SOUND);
		className.set ("assets/sounds/explode.ogg", __ASSET__assets_sounds_explode_ogg);
		type.set ("assets/sounds/explode.ogg", AssetType.SOUND);
		className.set ("assets/sounds/explode.wav", __ASSET__assets_sounds_explode_wav);
		type.set ("assets/sounds/explode.wav", AssetType.SOUND);
		className.set ("assets/sounds/fire", __ASSET__assets_sounds_fire);
		type.set ("assets/sounds/fire", AssetType.BINARY);
		className.set ("assets/sounds/fire.ogg", __ASSET__assets_sounds_fire_ogg);
		type.set ("assets/sounds/fire.ogg", AssetType.SOUND);
		className.set ("assets/sounds/Flames.ogg", __ASSET__assets_sounds_flames_ogg);
		type.set ("assets/sounds/Flames.ogg", AssetType.SOUND);
		className.set ("assets/sounds/Flames.wav", __ASSET__assets_sounds_flames_wav);
		type.set ("assets/sounds/Flames.wav", AssetType.SOUND);
		className.set ("assets/sounds/jump.ogg", __ASSET__assets_sounds_jump_ogg);
		type.set ("assets/sounds/jump.ogg", AssetType.SOUND);
		className.set ("assets/sounds/jump.wav", __ASSET__assets_sounds_jump_wav);
		type.set ("assets/sounds/jump.wav", AssetType.SOUND);
		className.set ("assets/sounds/jump2.ogg", __ASSET__assets_sounds_jump2_ogg);
		type.set ("assets/sounds/jump2.ogg", AssetType.SOUND);
		className.set ("assets/sounds/jump2.wav", __ASSET__assets_sounds_jump2_wav);
		type.set ("assets/sounds/jump2.wav", AssetType.SOUND);
		className.set ("assets/sounds/land.ogg", __ASSET__assets_sounds_land_ogg);
		type.set ("assets/sounds/land.ogg", AssetType.SOUND);
		className.set ("assets/sounds/land.wav", __ASSET__assets_sounds_land_wav);
		type.set ("assets/sounds/land.wav", AssetType.SOUND);
		className.set ("assets/sounds/miniondeath.ogg", __ASSET__assets_sounds_miniondeath_ogg);
		type.set ("assets/sounds/miniondeath.ogg", AssetType.SOUND);
		className.set ("assets/sounds/miniondeath.wav", __ASSET__assets_sounds_miniondeath_wav);
		type.set ("assets/sounds/miniondeath.wav", AssetType.SOUND);
		className.set ("assets/sounds/open.ogg", __ASSET__assets_sounds_open_ogg);
		type.set ("assets/sounds/open.ogg", AssetType.SOUND);
		className.set ("assets/sounds/open.wav", __ASSET__assets_sounds_open_wav);
		type.set ("assets/sounds/open.wav", AssetType.SOUND);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/swoosh.ogg", __ASSET__assets_sounds_swoosh_ogg);
		type.set ("assets/sounds/swoosh.ogg", AssetType.SOUND);
		className.set ("assets/sounds/swoosh.wav", __ASSET__assets_sounds_swoosh_wav);
		type.set ("assets/sounds/swoosh.wav", AssetType.SOUND);
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/levels/0.tmx";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/levels/1.tmx";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/levels/2.tmx";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/levels/3.tmx";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/levels/32blocks.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/data/levels/32Blocks.tsx";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/levels/4.tmx";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/levels/5.tmx";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/levels/50blocks.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/data/levels/6.tmx";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/levels/64blocks.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/data/levels/7.tmx";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/levels/castle.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/data/levels/finalRoom.tmx";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/levels/monsterTest.tmx";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/levels/stonetileset.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/data/levels/test3.tmx";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/levels/testlevel.tmx";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/levels/testlevel2.tmx";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/32blocks.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/heroleap.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/herostand.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/main.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/mainAtlas.json";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/mainAtlas.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/portraits.json";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/portraits.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/titlebg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/titlefg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/mainloop.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/dead";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/sounds/dead.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/deflect";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/sounds/deflect.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/explode.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/explode.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/fire";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/sounds/fire.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Flames.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Flames.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/jump.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/jump.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/jump2.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/jump2.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/land.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/land.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/miniondeath.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/miniondeath.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/open.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/open.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/swoosh.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/swoosh.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/sounds/beep.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/sounds/flixel.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__flixel_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/fonts/monsterrat.ttf";
		className.set (id, __ASSET__flixel_fonts_monsterrat_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/images/ui/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/images/logo/default.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/data/levels/0.tmx", __ASSET__assets_data_levels_0_tmx);
		type.set ("assets/data/levels/0.tmx", AssetType.TEXT);
		
		className.set ("assets/data/levels/1.tmx", __ASSET__assets_data_levels_1_tmx);
		type.set ("assets/data/levels/1.tmx", AssetType.TEXT);
		
		className.set ("assets/data/levels/2.tmx", __ASSET__assets_data_levels_2_tmx);
		type.set ("assets/data/levels/2.tmx", AssetType.TEXT);
		
		className.set ("assets/data/levels/3.tmx", __ASSET__assets_data_levels_3_tmx);
		type.set ("assets/data/levels/3.tmx", AssetType.TEXT);
		
		className.set ("assets/data/levels/32blocks.png", __ASSET__assets_data_levels_32blocks_png);
		type.set ("assets/data/levels/32blocks.png", AssetType.IMAGE);
		
		className.set ("assets/data/levels/32Blocks.tsx", __ASSET__assets_data_levels_32blocks_tsx);
		type.set ("assets/data/levels/32Blocks.tsx", AssetType.TEXT);
		
		className.set ("assets/data/levels/4.tmx", __ASSET__assets_data_levels_4_tmx);
		type.set ("assets/data/levels/4.tmx", AssetType.TEXT);
		
		className.set ("assets/data/levels/5.tmx", __ASSET__assets_data_levels_5_tmx);
		type.set ("assets/data/levels/5.tmx", AssetType.TEXT);
		
		className.set ("assets/data/levels/50blocks.png", __ASSET__assets_data_levels_50blocks_png);
		type.set ("assets/data/levels/50blocks.png", AssetType.IMAGE);
		
		className.set ("assets/data/levels/6.tmx", __ASSET__assets_data_levels_6_tmx);
		type.set ("assets/data/levels/6.tmx", AssetType.TEXT);
		
		className.set ("assets/data/levels/64blocks.png", __ASSET__assets_data_levels_64blocks_png);
		type.set ("assets/data/levels/64blocks.png", AssetType.IMAGE);
		
		className.set ("assets/data/levels/7.tmx", __ASSET__assets_data_levels_7_tmx);
		type.set ("assets/data/levels/7.tmx", AssetType.TEXT);
		
		className.set ("assets/data/levels/castle.png", __ASSET__assets_data_levels_castle_png);
		type.set ("assets/data/levels/castle.png", AssetType.IMAGE);
		
		className.set ("assets/data/levels/finalRoom.tmx", __ASSET__assets_data_levels_finalroom_tmx);
		type.set ("assets/data/levels/finalRoom.tmx", AssetType.TEXT);
		
		className.set ("assets/data/levels/monsterTest.tmx", __ASSET__assets_data_levels_monstertest_tmx);
		type.set ("assets/data/levels/monsterTest.tmx", AssetType.TEXT);
		
		className.set ("assets/data/levels/stonetileset.png", __ASSET__assets_data_levels_stonetileset_png);
		type.set ("assets/data/levels/stonetileset.png", AssetType.IMAGE);
		
		className.set ("assets/data/levels/test3.tmx", __ASSET__assets_data_levels_test3_tmx);
		type.set ("assets/data/levels/test3.tmx", AssetType.TEXT);
		
		className.set ("assets/data/levels/testlevel.tmx", __ASSET__assets_data_levels_testlevel_tmx);
		type.set ("assets/data/levels/testlevel.tmx", AssetType.TEXT);
		
		className.set ("assets/data/levels/testlevel2.tmx", __ASSET__assets_data_levels_testlevel2_tmx);
		type.set ("assets/data/levels/testlevel2.tmx", AssetType.TEXT);
		
		className.set ("assets/images/32blocks.png", __ASSET__assets_images_32blocks_png);
		type.set ("assets/images/32blocks.png", AssetType.IMAGE);
		
		className.set ("assets/images/heroleap.png", __ASSET__assets_images_heroleap_png);
		type.set ("assets/images/heroleap.png", AssetType.IMAGE);
		
		className.set ("assets/images/herostand.png", __ASSET__assets_images_herostand_png);
		type.set ("assets/images/herostand.png", AssetType.IMAGE);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/main.png", __ASSET__assets_images_main_png);
		type.set ("assets/images/main.png", AssetType.IMAGE);
		
		className.set ("assets/images/mainAtlas.json", __ASSET__assets_images_mainatlas_json);
		type.set ("assets/images/mainAtlas.json", AssetType.TEXT);
		
		className.set ("assets/images/mainAtlas.png", __ASSET__assets_images_mainatlas_png);
		type.set ("assets/images/mainAtlas.png", AssetType.IMAGE);
		
		className.set ("assets/images/portraits.json", __ASSET__assets_images_portraits_json);
		type.set ("assets/images/portraits.json", AssetType.TEXT);
		
		className.set ("assets/images/portraits.png", __ASSET__assets_images_portraits_png);
		type.set ("assets/images/portraits.png", AssetType.IMAGE);
		
		className.set ("assets/images/titlebg.png", __ASSET__assets_images_titlebg_png);
		type.set ("assets/images/titlebg.png", AssetType.IMAGE);
		
		className.set ("assets/images/titlefg.png", __ASSET__assets_images_titlefg_png);
		type.set ("assets/images/titlefg.png", AssetType.IMAGE);
		
		className.set ("assets/music/mainloop.ogg", __ASSET__assets_music_mainloop_ogg);
		type.set ("assets/music/mainloop.ogg", AssetType.MUSIC);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/dead", __ASSET__assets_sounds_dead);
		type.set ("assets/sounds/dead", AssetType.BINARY);
		
		className.set ("assets/sounds/dead.ogg", __ASSET__assets_sounds_dead_ogg);
		type.set ("assets/sounds/dead.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/deflect", __ASSET__assets_sounds_deflect);
		type.set ("assets/sounds/deflect", AssetType.BINARY);
		
		className.set ("assets/sounds/deflect.ogg", __ASSET__assets_sounds_deflect_ogg);
		type.set ("assets/sounds/deflect.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/explode.ogg", __ASSET__assets_sounds_explode_ogg);
		type.set ("assets/sounds/explode.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/explode.wav", __ASSET__assets_sounds_explode_wav);
		type.set ("assets/sounds/explode.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/fire", __ASSET__assets_sounds_fire);
		type.set ("assets/sounds/fire", AssetType.BINARY);
		
		className.set ("assets/sounds/fire.ogg", __ASSET__assets_sounds_fire_ogg);
		type.set ("assets/sounds/fire.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/Flames.ogg", __ASSET__assets_sounds_flames_ogg);
		type.set ("assets/sounds/Flames.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/Flames.wav", __ASSET__assets_sounds_flames_wav);
		type.set ("assets/sounds/Flames.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/jump.ogg", __ASSET__assets_sounds_jump_ogg);
		type.set ("assets/sounds/jump.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/jump.wav", __ASSET__assets_sounds_jump_wav);
		type.set ("assets/sounds/jump.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/jump2.ogg", __ASSET__assets_sounds_jump2_ogg);
		type.set ("assets/sounds/jump2.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/jump2.wav", __ASSET__assets_sounds_jump2_wav);
		type.set ("assets/sounds/jump2.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/land.ogg", __ASSET__assets_sounds_land_ogg);
		type.set ("assets/sounds/land.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/land.wav", __ASSET__assets_sounds_land_wav);
		type.set ("assets/sounds/land.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/miniondeath.ogg", __ASSET__assets_sounds_miniondeath_ogg);
		type.set ("assets/sounds/miniondeath.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/miniondeath.wav", __ASSET__assets_sounds_miniondeath_wav);
		type.set ("assets/sounds/miniondeath.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/open.ogg", __ASSET__assets_sounds_open_ogg);
		type.set ("assets/sounds/open.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/open.wav", __ASSET__assets_sounds_open_wav);
		type.set ("assets/sounds/open.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/swoosh.ogg", __ASSET__assets_sounds_swoosh_ogg);
		type.set ("assets/sounds/swoosh.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/swoosh.wav", __ASSET__assets_sounds_swoosh_wav);
		type.set ("assets/sounds/swoosh.wav", AssetType.SOUND);
		
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = flash.net.URLLoaderDataFormat.BINARY;
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofData (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels_0_tmx extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels_1_tmx extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels_2_tmx extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels_3_tmx extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels_32blocks_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels_32blocks_tsx extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels_4_tmx extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels_5_tmx extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels_50blocks_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels_6_tmx extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels_64blocks_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels_7_tmx extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels_castle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels_finalroom_tmx extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels_monstertest_tmx extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels_stonetileset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels_test3_tmx extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels_testlevel_tmx extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_levels_testlevel2_tmx extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_32blocks_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_heroleap_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_herostand_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_main_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_mainatlas_json extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_mainatlas_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_portraits_json extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_portraits_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_titlebg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_titlefg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_mainloop_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_dead extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_dead_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_deflect extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_deflect_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_explode_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_explode_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_fire extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_fire_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flames_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flames_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_jump_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_jump_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_jump2_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_jump2_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_land_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_land_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_miniondeath_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_miniondeath_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_open_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_open_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_swoosh_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_swoosh_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5



























































@:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { super (); name = "Monsterrat"; } } 




#else



#if (windows || mac || linux || cpp)


@:file("assets/data/data-goes-here.txt") #if display private #end class __ASSET__assets_data_data_goes_here_txt extends lime.utils.Bytes {}
@:file("assets/data/levels/0.tmx") #if display private #end class __ASSET__assets_data_levels_0_tmx extends lime.utils.Bytes {}
@:file("assets/data/levels/1.tmx") #if display private #end class __ASSET__assets_data_levels_1_tmx extends lime.utils.Bytes {}
@:file("assets/data/levels/2.tmx") #if display private #end class __ASSET__assets_data_levels_2_tmx extends lime.utils.Bytes {}
@:file("assets/data/levels/3.tmx") #if display private #end class __ASSET__assets_data_levels_3_tmx extends lime.utils.Bytes {}
@:image("assets/data/levels/32blocks.png") #if display private #end class __ASSET__assets_data_levels_32blocks_png extends lime.graphics.Image {}
@:file("assets/data/levels/32Blocks.tsx") #if display private #end class __ASSET__assets_data_levels_32blocks_tsx extends lime.utils.Bytes {}
@:file("assets/data/levels/4.tmx") #if display private #end class __ASSET__assets_data_levels_4_tmx extends lime.utils.Bytes {}
@:file("assets/data/levels/5.tmx") #if display private #end class __ASSET__assets_data_levels_5_tmx extends lime.utils.Bytes {}
@:image("assets/data/levels/50blocks.png") #if display private #end class __ASSET__assets_data_levels_50blocks_png extends lime.graphics.Image {}
@:file("assets/data/levels/6.tmx") #if display private #end class __ASSET__assets_data_levels_6_tmx extends lime.utils.Bytes {}
@:image("assets/data/levels/64blocks.png") #if display private #end class __ASSET__assets_data_levels_64blocks_png extends lime.graphics.Image {}
@:file("assets/data/levels/7.tmx") #if display private #end class __ASSET__assets_data_levels_7_tmx extends lime.utils.Bytes {}
@:image("assets/data/levels/castle.png") #if display private #end class __ASSET__assets_data_levels_castle_png extends lime.graphics.Image {}
@:file("assets/data/levels/finalRoom.tmx") #if display private #end class __ASSET__assets_data_levels_finalroom_tmx extends lime.utils.Bytes {}
@:file("assets/data/levels/monsterTest.tmx") #if display private #end class __ASSET__assets_data_levels_monstertest_tmx extends lime.utils.Bytes {}
@:image("assets/data/levels/stonetileset.png") #if display private #end class __ASSET__assets_data_levels_stonetileset_png extends lime.graphics.Image {}
@:file("assets/data/levels/test3.tmx") #if display private #end class __ASSET__assets_data_levels_test3_tmx extends lime.utils.Bytes {}
@:file("assets/data/levels/testlevel.tmx") #if display private #end class __ASSET__assets_data_levels_testlevel_tmx extends lime.utils.Bytes {}
@:file("assets/data/levels/testlevel2.tmx") #if display private #end class __ASSET__assets_data_levels_testlevel2_tmx extends lime.utils.Bytes {}
@:image("assets/images/32blocks.png") #if display private #end class __ASSET__assets_images_32blocks_png extends lime.graphics.Image {}
@:image("assets/images/heroleap.png") #if display private #end class __ASSET__assets_images_heroleap_png extends lime.graphics.Image {}
@:image("assets/images/herostand.png") #if display private #end class __ASSET__assets_images_herostand_png extends lime.graphics.Image {}
@:file("assets/images/images-go-here.txt") #if display private #end class __ASSET__assets_images_images_go_here_txt extends lime.utils.Bytes {}
@:image("assets/images/main.png") #if display private #end class __ASSET__assets_images_main_png extends lime.graphics.Image {}
@:file("assets/images/mainAtlas.json") #if display private #end class __ASSET__assets_images_mainatlas_json extends lime.utils.Bytes {}
@:image("assets/images/mainAtlas.png") #if display private #end class __ASSET__assets_images_mainatlas_png extends lime.graphics.Image {}
@:file("assets/images/portraits.json") #if display private #end class __ASSET__assets_images_portraits_json extends lime.utils.Bytes {}
@:image("assets/images/portraits.png") #if display private #end class __ASSET__assets_images_portraits_png extends lime.graphics.Image {}
@:image("assets/images/titlebg.png") #if display private #end class __ASSET__assets_images_titlebg_png extends lime.graphics.Image {}
@:image("assets/images/titlefg.png") #if display private #end class __ASSET__assets_images_titlefg_png extends lime.graphics.Image {}
@:file("assets/music/mainloop.ogg") #if display private #end class __ASSET__assets_music_mainloop_ogg extends lime.utils.Bytes {}
@:file("assets/music/music-goes-here.txt") #if display private #end class __ASSET__assets_music_music_goes_here_txt extends lime.utils.Bytes {}
@:file("assets/sounds/dead") #if display private #end class __ASSET__assets_sounds_dead extends lime.utils.Bytes {}
@:file("assets/sounds/dead.ogg") #if display private #end class __ASSET__assets_sounds_dead_ogg extends lime.utils.Bytes {}
@:file("assets/sounds/deflect") #if display private #end class __ASSET__assets_sounds_deflect extends lime.utils.Bytes {}
@:file("assets/sounds/deflect.ogg") #if display private #end class __ASSET__assets_sounds_deflect_ogg extends lime.utils.Bytes {}
@:file("assets/sounds/explode.ogg") #if display private #end class __ASSET__assets_sounds_explode_ogg extends lime.utils.Bytes {}
@:file("assets/sounds/explode.wav") #if display private #end class __ASSET__assets_sounds_explode_wav extends lime.utils.Bytes {}
@:file("assets/sounds/fire") #if display private #end class __ASSET__assets_sounds_fire extends lime.utils.Bytes {}
@:file("assets/sounds/fire.ogg") #if display private #end class __ASSET__assets_sounds_fire_ogg extends lime.utils.Bytes {}
@:file("assets/sounds/Flames.ogg") #if display private #end class __ASSET__assets_sounds_flames_ogg extends lime.utils.Bytes {}
@:file("assets/sounds/Flames.wav") #if display private #end class __ASSET__assets_sounds_flames_wav extends lime.utils.Bytes {}
@:file("assets/sounds/jump.ogg") #if display private #end class __ASSET__assets_sounds_jump_ogg extends lime.utils.Bytes {}
@:file("assets/sounds/jump.wav") #if display private #end class __ASSET__assets_sounds_jump_wav extends lime.utils.Bytes {}
@:file("assets/sounds/jump2.ogg") #if display private #end class __ASSET__assets_sounds_jump2_ogg extends lime.utils.Bytes {}
@:file("assets/sounds/jump2.wav") #if display private #end class __ASSET__assets_sounds_jump2_wav extends lime.utils.Bytes {}
@:file("assets/sounds/land.ogg") #if display private #end class __ASSET__assets_sounds_land_ogg extends lime.utils.Bytes {}
@:file("assets/sounds/land.wav") #if display private #end class __ASSET__assets_sounds_land_wav extends lime.utils.Bytes {}
@:file("assets/sounds/miniondeath.ogg") #if display private #end class __ASSET__assets_sounds_miniondeath_ogg extends lime.utils.Bytes {}
@:file("assets/sounds/miniondeath.wav") #if display private #end class __ASSET__assets_sounds_miniondeath_wav extends lime.utils.Bytes {}
@:file("assets/sounds/open.ogg") #if display private #end class __ASSET__assets_sounds_open_ogg extends lime.utils.Bytes {}
@:file("assets/sounds/open.wav") #if display private #end class __ASSET__assets_sounds_open_wav extends lime.utils.Bytes {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.Bytes {}
@:file("assets/sounds/swoosh.ogg") #if display private #end class __ASSET__assets_sounds_swoosh_ogg extends lime.utils.Bytes {}
@:file("assets/sounds/swoosh.wav") #if display private #end class __ASSET__assets_sounds_swoosh_wav extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/sounds/beep.ogg") #if display private #end class __ASSET__flixel_sounds_beep_ogg extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/sounds/flixel.ogg") #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends lime.utils.Bytes {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/images/logo/default.png") #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_monsterrat_ttf (); src = font.src; name = font.name; super (); }}

#end

#end