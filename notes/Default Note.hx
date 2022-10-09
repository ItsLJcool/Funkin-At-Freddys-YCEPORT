enableRating = true;
var song = PlayState.song.song.toLowerCase();
var pixelsNote:Bool = false;
switch(song) {
    case "celebrate", "follow-me", "midnight", "you-can't", "umbra", "consequences":
        pixelsNote = true;
    default:
        pixelsNote = false;
}
function create() {
    if (!pixelsNote) {
    note.frames = Paths.getSparrowAtlas('NOTE_assets_colored', 'shared');

    switch(note.noteData % PlayState.song.keyNumber) {
        case 0:
            note.animation.addByPrefix('scroll', "purple0");
            note.animation.addByPrefix('holdend', "pruple end hold");
            note.animation.addByPrefix('holdpiece', "purple hold piece");
        case 1:
            note.animation.addByPrefix('scroll', "blue0");
            note.animation.addByPrefix('holdend', "blue hold end");
            note.animation.addByPrefix('holdpiece', "blue hold piece");
        case 2:
            note.animation.addByPrefix('scroll', "green0");
            note.animation.addByPrefix('holdend', "green hold end");
            note.animation.addByPrefix('holdpiece', "green hold piece");
        case 3:
            note.animation.addByPrefix('scroll', "red0");
            note.animation.addByPrefix('holdend', "red hold end");
            note.animation.addByPrefix('holdpiece', "red hold piece");
    }
    note.setGraphicSize(Std.int(note.width * 0.7));
    note.updateHitbox();
    note.antialiasing = true;
    note.colored = true;
    note.hitOnBotplay = true;

    note.animation.play('scroll');
    if (note.isSustainNote) {
        if (note.prevNote != null)
            if (note.prevNote.animation.curAnim.name == "holdend")
                note.prevNote.animation.play("holdpiece");
        note.animation.play("holdend");
    }
    } else {
        (song != 'consequences') ? note.loadGraphic(Paths.image('weeb/pixelUI/arrows-pixels-colored'), true, 17, 17) : note.loadGraphic(Paths.image('weeb/pixelUI/CONSEQUENCES_NOTE_assets'), true, 17, 17);
        (song != 'consequences') ? note.colored = true : note.colored = false;
        
        switch(note.noteData % 4) {
            case 0:
                note.animation.add('scroll', [4]);
            case 1:
                note.animation.add('scroll', [5]);
            case 2:
                note.animation.add('scroll', [6]);
            case 3:
                note.animation.add('scroll', [7]);
        }
    
        note.splash = Paths.splashes('weeb/splash');
        
        if (note.isSustainNote)
        {
            note.noteOffset.x += 30;
            (song != 'consequences') ? note.loadGraphic(Paths.image('weeb/pixelUI/arrowEnds-colored'), true, 7, 6) : note.loadGraphic(Paths.image('weeb/pixelUI/CONSEQUENCES_NOTE_assetsENDS'), true, 7, 6);
    
            switch(note.noteData % 4) {
                case 0:
                    note.animation.add('holdpiece', [0]);
                    note.animation.add('holdend', [4]);
                case 1:
                    note.animation.add('holdpiece', [1]);
                    note.animation.add('holdend', [5]);
                case 2:
                    note.animation.add('holdpiece', [2]);
                    note.animation.add('holdend', [6]);
                case 3:
                    note.animation.add('holdpiece', [3]);
                    note.animation.add('holdend', [7]);
            }
    
            note.animation.add('purpleholdend', [4]);
            note.animation.add('greenholdend', [6]);
            note.animation.add('redholdend', [7]);
            note.animation.add('blueholdend', [5]);
    
            note.animation.add('purplehold', [0]);
            note.animation.add('greenhold', [2]);
            note.animation.add('redhold', [3]);
            note.animation.add('bluehold', [1]);
        }
    
        note.setGraphicSize(Std.int(note.width * PlayState_.daPixelZoom));
        note.updateHitbox();
    }
}
function generateStaticArrow(babyArrow:FlxSprite, i:Int) {
    
    (song != 'consequences') ? babyArrow.colored = true : babyArrow.colored = false;
    if (pixelsNote) {
    (song != 'consequences') ? babyArrow.loadGraphic(Paths.image('weeb/pixelUI/arrows-pixels-colored'), true, 17, 17) : babyArrow.loadGraphic(Paths.image('weeb/pixelUI/CONSEQUENCES_NOTE_assets'), true, 17, 17);
    babyArrow.animation.add('green', [6]);
    babyArrow.animation.add('red', [7]);
    babyArrow.animation.add('blue', [5]);
    babyArrow.animation.add('purplel', [4]);

    babyArrow.setGraphicSize(Std.int(babyArrow.width * PlayState_.daPixelZoom));
    babyArrow.updateHitbox();
    babyArrow.antialiasing = false;
    
    var noteNumberScheme:Array<NoteDirection> = Note.noteNumberSchemes[PlayState.song.keyNumber];
    if (noteNumberScheme == null) noteNumberScheme = Note.noteNumberSchemes[4];
    switch (noteNumberScheme[i % noteNumberScheme.length])
    {
        case 0:
            babyArrow.animation.add('static', [0]);
            babyArrow.animation.add('pressed', [4, 8], 12, false);
            babyArrow.animation.add('confirm', [12, 16], 24, false);
        case 1:
            babyArrow.animation.add('static', [1]);
            babyArrow.animation.add('pressed', [5, 9], 12, false);
            babyArrow.animation.add('confirm', [13, 17], 24, false);
        case 2:
            babyArrow.animation.add('static', [2]);
            babyArrow.animation.add('pressed', [6, 10], 12, false);
            babyArrow.animation.add('confirm', [14, 18], 12, false);
        case 3:
            babyArrow.animation.add('static', [3]);
            babyArrow.animation.add('pressed', [7, 11], 12, false);
            babyArrow.animation.add('confirm', [15, 19], 24, false);
    }
    }
    else {
        babyArrow.frames = Paths.getSparrowAtlas('NOTE_assets_colored', 'shared');
        babyArrow.animation.addByPrefix('green', 'arrowUP');
        babyArrow.animation.addByPrefix('blue', 'arrowDOWN');
        babyArrow.animation.addByPrefix('purple', 'arrowLEFT0');
        babyArrow.animation.addByPrefix('red', 'arrowRIGHT0');

        babyArrow.antialiasing = true;
        babyArrow.setGraphicSize(Std.int(babyArrow.width * 0.7));

        var noteNumberScheme:Array<NoteDirection> = Note.noteNumberSchemes[PlayState.song.keyNumber];
        if (noteNumberScheme == null) noteNumberScheme = Note.noteNumberSchemes[4];
        switch (noteNumberScheme[i % noteNumberScheme.length])
        {
            case 0:
				babyArrow.animation.addByPrefix('static', 'arrowLEFT0');
				babyArrow.animation.addByPrefix('pressed', 'left press', 24, false);
				babyArrow.animation.addByPrefix('confirm', 'left confirm', 24, false);
            case 1:
                babyArrow.animation.addByPrefix('static', 'arrowDOWN');
                babyArrow.animation.addByPrefix('pressed', 'down press', 24, false);
                babyArrow.animation.addByPrefix('confirm', 'down confirm', 24, false);
            case 2:
                babyArrow.animation.addByPrefix('static', 'arrowUP');
                babyArrow.animation.addByPrefix('pressed', 'up press', 24, false);
                babyArrow.animation.addByPrefix('confirm', 'up confirm', 24, false);
            case 3:
                babyArrow.animation.addByPrefix('static', 'arrowRIGHT0');
                babyArrow.animation.addByPrefix('pressed', 'right press', 24, false);
                babyArrow.animation.addByPrefix('confirm', 'right confirm', 24, false);
        }
                
    }
}

function onPlayerHit() {
    for (boy in PlayState.boyfriends) {
        switch(note.noteData % PlayState.song.keyNumber) {
            case 0:
                boy.playAnim("singLEFT", true);
            case 1:
                boy.playAnim("singDOWN", true);
            case 2:
                boy.playAnim("singUP", true);
            case 3:
                boy.playAnim("singRIGHT", true);
        }
    }
}