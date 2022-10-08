var songName = PlayState.song.song.toLowerCase();
function create() {
    if (song == songName)
        switch(song) {
          case "Celebrate", "Follow-Me", "Midnight", "you-can't":
            text();
    }
}


function text() {
    for(m in PlayState.members) {
        if (Std.isOfType(m, FlxText) && !Std.isOfType(m, FlxTypeText)) {
            // m.embeddedFont = true;
            m.font = Paths.font("pixelmix_micro");
            m.size *= 1.5;
            m.color = 0xFFFFC400;
        }
    }
}