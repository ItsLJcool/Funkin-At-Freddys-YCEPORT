//a
var stage:Stage = null;
function create() {
	stage = loadStage('consequences');
	stage.getSprite("pond").setGraphicSize(Std.int(bg.width * 5.2));
	autoCamZooming = false;
}
function update(elapsed) {
	stage.update(elapsed);
	
	PlayState.camFollow.y = 500;
	PlayState.camFollow.x = 600;
	FlxG.camera.focusOn(PlayState.camFollow.getPosition());
}
function beatHit(curBeat) {
	stage.onBeat();
}