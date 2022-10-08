//a
import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxEmitterMode;
import flixel.math.FlxMath;
import CoolUtil;

var stage:Stage = null;
function create() {
	stage = loadStage('FourthWall');
	remove(boyfriend);
	remove(dad);
	doNewCreateLOL();
}

function onGenerateStaticArrows() {
	for (i in PlayState.cpuStrums.members) {
		i.alpha = 0;
	}
}

function createPost() {
	add(boyfriend);
	add(dad);
}
var dust:FlxBackdrop;
var dustFG:FlxBackdrop;
function update(elapsed) {
	stage.update(elapsed);
	PlayState.gf.visible = false;
	if(dust != null) {
		dust.y = FlxMath.lerp(dust.y, dust.y + 17, boundTo(elapsed * 9, 0, 1));
		dust.x = FlxMath.lerp(dust.x, dust.x - 27, boundTo(elapsed * 9, 0, 1));
	}

	if(dustFG != null) {
		dustFG.y = FlxMath.lerp(dustFG.y, dustFG.y + 29, boundTo(elapsed * 9, 0, 1));
		dustFG.x = FlxMath.lerp(dustFG.x, dustFG.x - 33, boundTo(elapsed * 9, 0, 1));
	}

	dust.alpha = FlxMath.lerp(0.6, dust.alpha, boundTo(1 - (elapsed * 3.125), 0, 1));
	dustFG.alpha = FlxMath.lerp(0.5, dustFG.alpha, boundTo(1 - (elapsed * 3.125), 0, 1));
}
function boundTo(value:Float, min:Float, max:Float):Float {
	var newValue:Float = value;
	if(newValue < min) newValue = min;
	else if(newValue > max) newValue = max;
	return newValue;
}

function stepHit(curStep) {
	// trace(lightningTimer);
}

var lightTween:FlxTween;
function beatHit(curBeat) {
	stage.onBeat();


	if (curBeat % lightningTimer == 0){
		lightning.flipX = FlxG.random.bool(50);

		vignette.alpha = 0;
		if(lightningTimer >= 2) FlxTween.tween(vignette, {alpha: 0.4}, 0.4 * lightningTimer);
		if(lightningTimer < 2){
			lightgrad7.alpha = 0.7;
			if(lightTween != null) lightTween.cancel();
			lightTween = FlxTween.tween(lightgrad7, {alpha: 0}, 0.4 * lightningTimer);
		} 
		lightning.alpha = 1;

		switch(FlxG.random.int(0, 2)){
			case 0:
				lightning.x = FlxG.random.int(-200, 1000);
				lightning.animation.play('blue', true);
				lightgrad1.alpha = 0.9;
				FlxTween.tween(lightgrad1, {alpha: 0}, 0.4 * lightningTimer);
				lightgrad4.alpha = 0.6;
				FlxTween.tween(lightgrad4, {alpha: 0}, 0.4 * lightningTimer);
			case 1:
				lightning.x = FlxG.random.int(-200, 1000);
				lightning.animation.play('pink', true);
				lightgrad2.alpha = 0.9;
				FlxTween.tween(lightgrad2, {alpha: 0}, 0.4 * lightningTimer);
				lightgrad5.alpha = 0.6;
				FlxTween.tween(lightgrad5, {alpha: 0}, 0.4 * lightningTimer);
			case 2:
				lightning.x = FlxG.random.int(-200, 1000);
				lightning.animation.play('purple', true);
				lightgrad3.alpha = 0.9;
				FlxTween.tween(lightgrad3, {alpha: 0}, 0.4 * lightningTimer);
				lightgrad6.alpha = 0.6;
				FlxTween.tween(lightgrad6, {alpha: 0}, 0.4 * lightningTimer);
		}
		lightning.animation.finishCallback = function(animName:String) {
			lightning.alpha = 0;
		}
	}
}

var emitter:FlxEmitter;
var emitter2:FlxEmitter;

var lightningTimer:Int = 1;
var lightning:FlxSprite;
var lightgrad1:FlxSprite;
var lightgrad2:FlxSprite;
var lightgrad3:FlxSprite;
var lightgrad4:FlxSprite;
var lightgrad5:FlxSprite;
var lightgrad6:FlxSprite;
var lightgrad7:FlxSprite;
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

		// lightgrad1 = new BGSprite('stages/scott/grad1', 0, 150, 0.5, 0.5);

		lightgrad1 = new FlxSprite(0, 150).loadGraphic(Paths.image('stages/scott/grad1'));
		lightgrad1.blend = 0;
		lightgrad1.scrollFactor.set(0.5,0.5);
		lightgrad1.setGraphicSize(Std.int(lightgrad1.width * 1.3));
		insert(10, lightgrad1);
		lightgrad2 = new FlxSprite(0, 150).loadGraphic(Paths.image('stages/scott/grad2'));
		lightgrad2.blend = 0;
		lightgrad2.scrollFactor.set(0.5,0.5);
		lightgrad2.setGraphicSize(Std.int(lightgrad2.width * 1.3));
		add(lightgrad2);
		lightgrad3 = new FlxSprite(0, 150).loadGraphic(Paths.image('stages/scott/grad3'));
		lightgrad3.blend = 0;
		lightgrad3.scrollFactor.set(0.5,0.5);
		lightgrad3.setGraphicSize(Std.int(lightgrad3.width * 1.3));
		add(lightgrad3);

		lightgrad1.alpha = 0;
		lightgrad2.alpha = 0;
		lightgrad3.alpha = 0;

		// lightning = new BGSprite('stages/scott/lightning', 330, 250, 0.6, 0.6, ['blue', 'pink', 'purple']);
		lightning = new FlxSprite(330, 250);
		lightning.frames = Paths.getSparrowAtlas('stages/scott/lightning');
		lightning.animation.addByPrefix('blue', 'blue', 24);
		lightning.animation.addByPrefix('pink', 'pink', 24);
		lightning.animation.addByPrefix('purple', 'purple', 24);
		lightning.animation.play('blue');
		lightning.antialiasing = EngineSettings.antialiasing;
		lightning.scrollFactor.set(0.5,0.5);
		lightning.setGraphicSize(Std.int(lightning.width * 2));
		add(lightning);
		lightning.alpha = 0;

		// vignette = new BGSprite('stages/scott/gradient', 0, 0, 0, 0);
		vignette = new FlxSprite(0,0).loadGraphic(Paths.image('stages/scott/gradient'));
		vignette.scrollFactor.set(0,0);
		vignette.setGraphicSize(Std.int(vignette.width * 1.3));
		vignette.updateHitbox();
		vignette.screenCenter();
		vignette.alpha = 0;
		add(vignette);

		// dust = new FlxBackdrop(Paths.image('stages/scott/dust'), 5.3, 5.3, true, true);
		dust = new FlxBackdrop(Paths.image('stages/scott/dust'), 6.3, 6.3, true, true);
		dust.setPosition(3.35, 25);
		dust.antialiasing = true;
		dust.updateHitbox();
		dust.blend = 0;
		dust.alpha = 0.6;
		add(dust);

		// dustFG = new FlxBackdrop(Paths.image('stages/scott/dustFG'), 6.4, 6.4, true, true);
		dustFG = new FlxBackdrop(Paths.image('stages/scott/dustFG'), 7.4, 7.4, true, true);
		dustFG.setPosition(-24.45, 17.6);
		dustFG.antialiasing = true;
		dustFG.updateHitbox();
		dustFG.blend = 0;
		dustFG.alpha = 0.5;
		add(dustFG);

		// dust.velocity.set(-200,200);
		// dustFG.velocity.set(-100,200);

		// lightgrad4 = new BGSprite('stages/scott/grad1', 0, 250, 0.5, 0.5);
		lightgrad4 = new FlxSprite(0,250).loadGraphic(Paths.image('stages/scott/grad1'));
		lightgrad4.scrollFactor.set(0.5,0.5);
		lightgrad4.blend = 0;
		lightgrad4.setGraphicSize(Std.int(lightgrad4.width * 1.3));
		add(lightgrad4);
		lightgrad5 = new FlxSprite(0,250).loadGraphic(Paths.image('stages/scott/grad2'));
		lightgrad5.scrollFactor.set(0.5,0.5);
		lightgrad5.blend = 0;
		lightgrad5.setGraphicSize(Std.int(lightgrad5.width * 1.3));
		add(lightgrad5);
		lightgrad6 = new FlxSprite(0,250).loadGraphic(Paths.image('stages/scott/grad3'));
		lightgrad6.scrollFactor.set(0.5,0.5);
		lightgrad6.blend = 0;
		lightgrad6.setGraphicSize(Std.int(lightgrad6.width * 1.3));
		add(lightgrad6);

		// lightgrad7 = new BGSprite('stages/scott/grad4', 0, 150, 0.5, 0.5);
		lightgrad7 = new FlxSprite(0,0).loadGraphic(Paths.image('stages/scott/grad4'));
		lightgrad7.scrollFactor.set(0.5,0.5);
		lightgrad7.blend = 0;
		lightgrad7.setGraphicSize(Std.int(lightgrad7.width * 1.3));
		add(lightgrad7);

		lightgrad4.alpha = 0;
		lightgrad5.alpha = 0;
		lightgrad6.alpha = 0;
		lightgrad7.alpha = 0;

}