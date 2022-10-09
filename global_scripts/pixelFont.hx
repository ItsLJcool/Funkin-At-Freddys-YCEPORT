//a
import flixel.text.FlxTextBorderStyle;
var songName = PlayState.song.song.toLowerCase();
function createPost() {
    trace(songName);
    switch(songName) {
      case "celebrate", "follow-me", "midnight", "you-can't", "umbra", "consequences":
        text();
    }
}


function text() {
    for(m in PlayState.members) {
    if (Std.isOfType(m, FlxSprite)) {
        m.antialiasing = false;
    }
    if (Std.isOfType(m, FlxText)) {
        // lol it's actually a built in flixel font
        m.font = Paths.font("retro_computer_personal_use"); // YOSHI DOSN'T NEED THE .tff EXTENSION YES
        }
    }  
}