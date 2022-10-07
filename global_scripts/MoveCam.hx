// a
import Section;

var moveCam = 20;
var songMoveCams = [
    "just-a-theory",
    "fourth-wall"
];

var songName = PlayState.song.song.toLowerCase();
function create() {
    for (song in songMoveCams) {
        if (song == songName)
            moveCam = 20;
        else
            moveCam = 0;
    }
}

function postUpdate(elapsed:Float) {
    var animName = "";
    var animNameGF = "";
    if (PlayState.section.mustHitSection) {
        animName = PlayState.boyfriend.animation.curAnim.name;
        animNameGF = PlayState.gf.animation.curAnim.name; }
    else {
        animName = PlayState.dad.animation.curAnim.name; 
        animNameGF = PlayState.gf.animation.curAnim.name; }

    if (animName == 'singLEFT' || animName == 'singLEFT-alt' || animNameGF == 'singLEFT' || animNameGF == 'singLEFT-alt') {
      PlayState.camFollow.x -= moveCam;
    }
    if (animName == 'singRIGHT' || animName == 'singRIGHT-alt' || animNameGF == 'singRIGHT' || animNameGF == 'singRIGHT-alt') {
      PlayState.camFollow.x += moveCam;
    }
    if (animName == 'singUP' || animName == 'singUP-alt' || animNameGF == 'singUP' || animNameGF == 'singUP-alt') {
      PlayState.camFollow.y -= moveCam;
    }
    if (animName == 'singDOWN' || animName =='singDOWN-alt' || animNameGF == 'singDOWN' || animNameGF == 'singDOWN-alt') {
      PlayState.camFollow.y += moveCam;
    }
}