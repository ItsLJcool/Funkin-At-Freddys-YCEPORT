var stage:Stage = null;
function create() {
	stage = loadStage('frightAAABURN');
	gf.visible = false;
	dad.x -= 300;
	// dad.y -= 200;

	bg = new FlxSprite(-50, -50).loadGraphic(Paths.image('stages/frightAAABURN/Wall'));
	bg.setGraphicSize(Std.int(bg.width * 1.6));
	bg.antialiasing = EngineSettings.antialiasing;
	add(bg);

	floor = new FlxSprite(-50, -50).loadGraphic(Paths.image('stages/frightAAABURN/floor'));
	floor.setGraphicSize(Std.int(floor.width * 1.6));
	floor.antialiasing = EngineSettings.antialiasing;
	add(floor);

	banner = new FlxSprite(-100, -50).loadGraphic(Paths.image('stages/frightAAABURN/Banner'));
	banner.setGraphicSize(Std.int(banner.width * 1.6));
	banner.antialiasing = true;
	add(banner);

	sbplush = new FlxSprite(1180, 450).loadGraphic(Paths.image('stages/frightAAABURN/cretin'));
	sbplush.setGraphicSize(Std.int(sbplush.width * 1.6));
	sbplush.antialiasing = true;
	sbplush.updateHitbox();
	add(sbplush);

	fireSpring = new FlxSprite(-230, -150);
	fireSpring.frames = Paths.getSparrowAtlas('stages/frightAAABURN/fire');
	fireSpring.animation.addByPrefix('fire', "fire idle", 16);
	fireSpring.scrollFactor.set(0.5,1);
	fireSpring.setGraphicSize(Std.int(fireSpring.width * 1.4));
	fireSpring.antialiasing = true;
	fireSpring.updateHitbox();
	fireSpring.animation.play('fire');
	add(fireSpring);

	smokeNight = new FlxSprite(-100, -50).loadGraphic(Paths.image('stages/frightAAABURN/smokeyBacon'));
	smokeNight.setGraphicSize(Std.int(smokeNight.width * 2));
	smokeNight.antialiasing = true;
	add(smokeNight);

	lightNight = new FlxSprite(-100, -50).loadGraphic(Paths.image('stages/frightAAABURN/oraligh'));
	lightNight.setGraphicSize(Std.int(lightNight.width * 2));
	lightNight.antialiasing = true;
	add(lightNight);

	// emitterSpring = new FlxEmitter(-2080.5, 1532.4);
	// emitterSpring.launchMode = FlxEmitterMode.SQUARE;
	// emitterSpring.velocity.set(-50, -400, 50, -800, -100, 0, 100, -800);
	// emitterSpring.scale.set(4, 4, 4, 4, 0, 0, 0, 0);
	// emitterSpring.drag.set(0, 0, 0, 0, 5, 5, 10, 10);
	// emitterSpring.width = 4787.45;
	// emitterSpring.alpha.set(1, 1);
	// emitterSpring.lifespan.set(4, 4.5);
	// emitterSpring.loadParticles(Paths.image('stages/frightAAABURN/ember1'), 500, 16, true);
			
	// emitterSpring.start(false, FlxG.random.float(0.3, 0.4), 100000);

	// emitterSpring2 = new FlxEmitter(-2080.5, 1532.4);
	// emitterSpring2.launchMode = FlxEmitterMode.SQUARE;
	// emitterSpring2.velocity.set(-50, -400, 50, -800, -100, 0, 100, -800);
	// emitterSpring2.scale.set(4, 4, 4, 4, 0, 0, 0, 0);
	// emitterSpring2.drag.set(0, 0, 0, 0, 5, 5, 10, 10);
	// emitterSpring2.width = 4787.45;
	// emitterSpring2.alpha.set(1, 1);
	// emitterSpring2.lifespan.set(4, 4.5);
	// emitterSpring2.loadParticles(Paths.image('stages/frightAAABURN/ember1'), 500, 16, true);
			
	// emitterSpring2.start(false, FlxG.random.float(0.3, 0.4), 100000);

	blackScrAfton = new FlxSprite().makeGraphic(FlxG.width * 3, FlxG.height + 700, FlxColor.BLACK);
	blackScrAfton.alpha = 0;
	blackScrAfton.screenCenter();
	add(blackScrAfton);

	springStatic = new FlxSprite();
	springStatic.frames = Paths.getSparrowAtlas('stages/frightAAABURN/static');
	springStatic.animation.addByPrefix('static', "idle", 16);
	springStatic.scrollFactor.set();
	springStatic.setGraphicSize(Std.int(springStatic.width * 2));
	springStatic.antialiasing = true;
	springStatic.updateHitbox();
	springStatic.screenCenter();
	springStatic.alpha = 0;
	springStatic.animation.play('static');
	add(springStatic);
	
	flashSprite = new FlxSprite(-50, 0).makeGraphic(FlxG.width * 3, FlxG.height * 3, 0xFFb30000);
	flashSprite.cameras = [camHUD];
	flashSprite.alpha = 0;
	add(flashSprite);

	remove(boyfriend);
	insert(100, boyfriend);
	remove(dad);
	insert(100, dad);
	remove(fireSpring);
	insert(100, fireSpring);
	remove(smokeNight);
	insert(100, smokeNight	);
	remove(lightNight);
	insert(100, lightNight);
	remove(blackScrAfton);
	insert(100, blackScrAfton);
	remove(flashSprite);
	insert(100, flashSprite);
	remove(springStatic);
	insert(100, springStatic);
}
function update(elapsed) {
	stage.update(elapsed);
}
function beatHit(curBeat) {
	stage.onBeat();
}


function beep() {
	flashSprite.alpha = 0.4;
	FlxTween.tween(flashSprite, {alpha: 0}, 0.15, {startDelay: 0.15});

}

function springJump() {
	camGame.flash(0xffffffff, 5);
	camHUD.visible = false;
	blackScrAfton.alpha = 1;
	springStatic.alpha = 0.5;
}
