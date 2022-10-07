//a
import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxEmitterMode;
import flixel.system.FlxBGSprite;
import flixel.FlxSprite;

var stage:Stage = null;
function create() {
	stage = loadStage('FourthWall');
	doNewCreateLOL();
}
function update(elapsed) {
	stage.update(elapsed);
	PlayState.gf.visible = false;
}
function beatHit(curBeat) {
	stage.onBeat();
}

var emitter:FlxEmitter;
var emitter2:FlxEmitter;

var lightningTimer:Int = 2;
var lightning:BGSprite;
var lightgrad1:BGSprite;
var lightgrad2:BGSprite;
var lightgrad3:BGSprite;
function doNewCreateLOL() {
	
	// for (i in 0...6) {
	// 		//first time using emitters sorry if i broke an unspeakable rule or something YES ziffy you did you idiot
	// 		//hi ziffy hi fabs
	// 		// hi guys i can say Nigger
	// 		//thanks clow
	// 		//wow really a "RACISMS" and a "MANIPULATIONS" moment clowfoe
	// 		//
	// 		emitter = new FlxEmitter(-2080.5, 1532.4);
	// 		emitter.launchMode = FlxEmitterMode.SQUARE;
	// 		emitter.velocity.set(-50, -400, 50, -800, -100, 0, 100, -800);
	// 		emitter.scale.set(4, 4, 4, 4, 0, 0, 0, 0);
	// 		emitter.drag.set(0, 0, 0, 0, 5, 5, 10, 10);
	// 		emitter.width = 4787.45;
	// 		emitter.alpha.set(1, 1);
	// 		emitter.lifespan.set(2, 2.5);
	// 		emitter.loadParticles(Paths.image('stages/scott/ember1'), 500, 16, true);
				
	// 		emitter.start(false, FlxG.random.float(0.3, 0.4), 100000);
	// 		add(emitter);
	// 	}	

	// 	for (i in 0...6) {
	// 		//first time using emitters sorry if i broke an unspeakable rule or something YES ziffy you did you idiot
	// 		emitter2 = new FlxEmitter(-2080.5, 1532.4);
	// 		emitter2.launchMode = FlxEmitterMode.SQUARE;
	// 		emitter2.velocity.set(-50, -300, 50, -700, -100, 0, 100, -700);
	// 		emitter2.scale.set(4, 4, 4, 4, 0, 0, 0, 0);
	// 		emitter2.drag.set(0, 0, 0, 0, 5, 5, 10, 10);
	// 		emitter2.width = 4787.45;
	// 		emitter2.alpha.set(1, 1);
	// 		emitter2.lifespan.set(2, 2.5);
	// 		emitter2.loadParticles(Paths.image('stages/scott/ember2'), 500, 16, true);
				
	// 		emitter2.start(false, FlxG.random.float(0.4, 0.5), 100000);
	// 		add(emitter2);
	// 	}	

		lightgrad1 = new BGSprite('stages/scott/grad1', 0, 150, 0.5, 0.5);
		lightgrad1.blend = 0;
		lightgrad1.setGraphicSize(Std.int(lightgrad1.width * 1.3));
		add(lightgrad1);
		lightgrad2 = new BGSprite('stages/scott/grad2', 0, 150, 0.5, 0.5);
		lightgrad2.blend = 0;
		lightgrad2.setGraphicSize(Std.int(lightgrad2.width * 1.3));
		add(lightgrad2);
		lightgrad3 = new BGSprite('stages/scott/grad3', 0, 150, 0.5, 0.5);
		lightgrad3.blend = 0;
		lightgrad3.setGraphicSize(Std.int(lightgrad3.width * 1.3));
		add(lightgrad3);		

		lightgrad1.alpha = 0;
		lightgrad2.alpha = 0;
		lightgrad3.alpha = 0;

		lightning = new BGSprite('stages/scott/lightning', 330, 250, 0.6, 0.6, ['blue', 'pink', 'purple']);
		lightning.setGraphicSize(Std.int(lightning.width * 2));
		add(lightning);

		vignette = new BGSprite('stages/scott/gradient', 0, 0, 0, 0);
		vignette.setGraphicSize(Std.int(vignette.width * 1.3));
		vignette.updateHitbox();
		vignette.screenCenter();
		vignette.alpha = 0;
		add(vignette);
}