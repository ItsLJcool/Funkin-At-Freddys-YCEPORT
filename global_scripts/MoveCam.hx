// a
import Section;

var moveCam = 20;

var songName = PlayState.song.song.toLowerCase();
function create() {
    switch(songName) {
      case "just-a-theory", "salvage", "nightmare":
        moveCam = 20;
      case "fourth-wall":
        moveCam = 100;
        
      default:
        moveCam = 0;
  }
}
var canCamMove:Bool = false;
function musicstart() {
  canCamMove = true;
}
function postUpdate(elapsed:Float) {
  if (canCamMove) camMove();
}

function camMove() {
  var animName = "";
  var animNameGF = "";
  if (PlayState.section.mustHitSection) {
      (songName == "fourth-wall") ? animName = PlayState.dad.animation.curAnim.name : animName = PlayState.boyfriend.animation.curAnim.name;
      animNameGF = PlayState.gf.animation.curAnim.name; }
  else {
      animName = PlayState.dad.animation.curAnim.name; 
      animNameGF = PlayState.gf.animation.curAnim.name; }

  if (animName == 'singLEFT' || animName == 'singLEFT-alt' || animNameGF == 'singLEFT' || animNameGF == 'singLEFT-alt')
    PlayState.camFollow.x -= moveCam;

  if (animName == 'singRIGHT' || animName == 'singRIGHT-alt' || animNameGF == 'singRIGHT' || animNameGF == 'singRIGHT-alt')
    PlayState.camFollow.x += moveCam;

  if (animName == 'singUP' || animName == 'singUP-alt' || animNameGF == 'singUP' || animNameGF == 'singUP-alt')
    PlayState.camFollow.y -= moveCam;
  
  if (animName == 'singDOWN' || animName =='singDOWN-alt' || animNameGF == 'singDOWN' || animNameGF == 'singDOWN-alt')
    PlayState.camFollow.y += (songName == "fourth-wall") ? 20 : moveCam;
}