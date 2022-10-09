//a
var stage:Stage = null;
function create() {
	stage = loadStage('aftonStage');
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