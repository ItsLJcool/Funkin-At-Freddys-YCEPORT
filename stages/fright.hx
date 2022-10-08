var stage:Stage = null;
function create() {
	stage = loadStage('fright');
	bg = new FlxSprite(-50, -50).loadGraphic(Paths.image('stages/fright/iminyourwalls'));
	bg.setGraphicSize(Std.int(bg.width * 1.6));
	bg.antialiasing = EngineSettings.antialiasing;
	add(bg);

	floor = new FlxSprite(-50, -50).loadGraphic(Paths.image('stages/fright/floor'));
	floor.setGraphicSize(Std.int(bg.width * 1.6));
	floor.antialiasing = EngineSettings.antialiasing;
	add(floor);

	gradientSalvage = new FlxSprite(-50, -50).loadGraphic(Paths.image('stages/fright/gradient'));
	gradientSalvage.setGraphicSize(Std.int(gradientSalvage.width * 1.6));
	gradientSalvage.antialiasing = EngineSettings.antialiasing;
	add(gradientSalvage);

	remove(boyfriend);
	insert(100, boyfriend);
	remove(dad);
	insert(100, dad);
	remove(gradientSalvage);
	insert(100, gradientSalvage);
}
function update(elapsed) {
	stage.update(elapsed);
}
function beatHit(curBeat) {
	stage.onBeat();
}