//a
import flixel.effects.FlxFlicker;
import PlayState;
import CoolUtil;
import LoadingState;
import flixel.input.mouse.FlxMouseEventManager;

// keys cool
var controls = FlxG.keys.pressed;
var controlsJust = FlxG.keys.justPressed;
var controlsJustNUM = FlxControls.anyJustPressed;
var controlsNUM = FlxControls.anyPressed;

var selectedSomethin:Bool = false;
var menuCurSelected:Int = 0;
var optionShit:Array<String> = ['afton', 'extras', 'options', 'credits'];

var menuItems:Array<FlxSprite> = [];

var arrowMenu:FlxSprite;
var difficultyMenu:FlxSprite;
function create() {
}
var storyWeek:Json = Json.parse(Assets.getText(Paths.getPath('weeks.json', 'TEXT', 'mods/' + mod))); // fucking Xav forgoring :skull:
var selectedSomethin:Bool = false;
function createPost() {
    
    state.defaultBehaviour = false;
    for (i in state.menuItems) {
        state.menuItems.remove(i);
    }

    state.bg.scale.set(1,1);
    state.bg.scrollFactor.set();

    wall = new FlxBackdrop(Paths.image('UI_Wall_Background'), 5, 1, true, true);
    wall.setPosition(0, -343);
    wall.scrollFactor.set();
    wall.updateHitbox();
    wall.velocity.set(-90,0);
    wall.antialiasing = EngineSettings.antialiasing;
    add(wall);

    var monitor:FlxSprite = new FlxSprite(-100, 0).loadGraphic(Paths.image('UI_Monitor'));
    monitor.setGraphicSize(Std.int(monitor.width * 1));
    monitor.scrollFactor.set();
    add(monitor);

    arrowMenu = new FlxSprite().loadGraphic(Paths.image('mainmenu/menu_afton_arrow'));
    arrowMenu.scrollFactor.set();
    arrowMenu.setGraphicSize(Std.int(arrowMenu.width * 0.6));
    arrowMenu.updateHitbox();
    arrowMenu.antialiasing = EngineSettings.antialiasing;
    add(arrowMenu);

    var aftonDifficulty:FlxSprite = new FlxSprite(325,450).loadGraphic(Paths.image('mainmenu/menu_afton_difficulty'));
    aftonDifficulty.setGraphicSize(Std.int(aftonDifficulty.width * 0.6));
    aftonDifficulty.scrollFactor.set();
    aftonDifficulty.updateHitbox();
    add(aftonDifficulty);

    difficultyMenu = new FlxSprite(aftonDifficulty.x, aftonDifficulty.y + 60);
    difficultyMenu.frames = Paths.getSparrowAtlas('mainmenu/afton_menu_diff');
    difficultyMenu.animation.addByPrefix('easy', "afton_menu_diff easy", 1);
    difficultyMenu.animation.addByPrefix('normal', "afton_menu_diff normal", 1);
    difficultyMenu.animation.addByPrefix('hard', "afton_menu_diff hard", 1);
    difficultyMenu.animation.play('hard');
    difficultyMenu.setGraphicSize(Std.int(difficultyMenu.width * 0.6));
    difficultyMenu.updateHitbox();
    difficultyMenu.scrollFactor.set();
    add(difficultyMenu);

    var aftonSystem:FlxSprite = new FlxSprite(monitor.x + 117, monitor.y + 305).loadGraphic(Paths.image('mainmenu/menu_afton_system'));
    aftonSystem.setGraphicSize(Std.int(aftonSystem.width * 0.6));
    aftonSystem.scrollFactor.set();
    add(aftonSystem);

    var gtLogo:FlxSprite = new FlxSprite(120, -450).loadGraphic(Paths.image('mainmenu/portrait/Character_Portrait_GT_Logo'));
    gtLogo.setGraphicSize(Std.int(gtLogo.width * 0.4));
    // gtLogo.visible = FlxG.save.data.matpatUnlocked;
    gtLogo.antialiasing = true;
    gtLogo.scrollFactor.set();
    add(gtLogo);

    var shadowPortrait:FlxSprite = new FlxSprite(120, -450).loadGraphic(Paths.image('mainmenu/portrait/Character_Portrait_Shadow_Bonnie'));
    shadowPortrait.setGraphicSize(Std.int(shadowPortrait.width * 0.4));
    // shadowPortrait.visible = FlxG.save.data.shadowBonnieUnlocked;
    shadowPortrait.antialiasing = true;
    shadowPortrait.scrollFactor.set();
    add(shadowPortrait);

    var springPortrait:FlxSprite = new FlxSprite(120, -450).loadGraphic(Paths.image('mainmenu/portrait/Character_Portrait_Spring_Bonnie'));
    springPortrait.setGraphicSize(Std.int(springPortrait.width * 0.4));
    // springPortrait.visible = FlxG.save.data.salvageBeaten;
    springPortrait.antialiasing = true;
    springPortrait.scrollFactor.set();
    add(springPortrait);

    var springtrapPortrait:FlxSprite = new FlxSprite(120, -450).loadGraphic(Paths.image('mainmenu/portrait/Character_Portrait_Springtrap'));
    springtrapPortrait.setGraphicSize(Std.int(springtrapPortrait.width * 0.4));
    // springtrapPortrait.visible = FlxG.save.data.nightmareBeaten;
    springtrapPortrait.antialiasing = true;
    springtrapPortrait.scrollFactor.set();
    add(springtrapPortrait);

    var aftonPortrait:FlxSprite = new FlxSprite(120, -450).loadGraphic(Paths.image('mainmenu/portrait/Character_Portrait_Afton'));
    aftonPortrait.setGraphicSize(Std.int(aftonPortrait.width * 0.4));
    aftonPortrait.visible = true;
    aftonPortrait.antialiasing = true;
    aftonPortrait.scrollFactor.set();
    add(aftonPortrait);

    FlxMouseEventManager.add(aftonPortrait, function onMouseDown(aftonPortrait:FlxSprite){fazbarsPlay();}, null);

    var scottPortrait:FlxSprite = new FlxSprite(120, -450).loadGraphic(Paths.image('mainmenu/portrait/Character_Portrait_Scott'));
    scottPortrait.setGraphicSize(Std.int(scottPortrait.width * 0.4));
    // scottPortrait.visible = FlxG.save.data.scottBeaten;
    scottPortrait.antialiasing = true;
    scottPortrait.scrollFactor.set();
    add(scottPortrait);

    for (i in 0...optionShit.length) {
		var offsetY:Float = 400 - (Math.max(optionShit.length, 4) - 4) * 80;
		var menuItem:FlxSprite = new FlxSprite(130, (i * 50)  + offsetY).loadGraphic(Paths.image('mainmenu/menu_afton_' + optionShit[i]));
		menuItem.scrollFactor.set(0, 0);
		menuItem.antialiasing = EngineSettings.antialiasing;
		menuItem.setGraphicSize(Std.int(menuItem.width * 0.58));
		menuItem.updateHitbox();
		menuItem.ID = i;
        menuItems.push(menuItem);
		add(menuItems[i]);
	}
    
	var logo:FlxSprite = new FlxSprite(-425, -475).loadGraphic(Paths.image('thelogo'));
	logo.setGraphicSize(Std.int(logo.width * 0.3));
	logo.scrollFactor.set();
	logo.antialiasing = true;
	add(logo);
    
    changeItem(0);
    changeDiff(2);
}

function update(elapsed:Float) {

    if (!selectedSomethin) {
        if (controlsJustNUM([87,38])) {
            CoolUtil.playMenuSFX(0);
            changeItem(-1); }

        if (controlsJustNUM([83,40])) {
            CoolUtil.playMenuSFX(0);
            changeItem(1); }

        if (controlsJustNUM([37,65]))
            changeDiff(-1);

        if (controlsJustNUM([39,68]))
            changeDiff(1);

        if (controlsJustNUM([13])) {
                selectedSomethin = true;
                FlxG.sound.play(Paths.sound('confirmMenu'));

                for (spr in menuItems) {
                    FlxFlicker.flicker(arrowMenu, 1, 0.06, false, false, function(flick:FlxFlicker) {
                        var daChoice:String = optionShit[menuCurSelected];
                        trace(daChoice);
                        switch (daChoice) {
                            case 'afton':
                                loadAndPlayStoryWeek(0, difficArray[curDifficulty]);
                            case 'extras':
                                FlxG.switchState(new FreeplayState());
                            case 'credits':
                                FlxG.switchState(new CreditsState());
                            case 'options':
                                FlxG.switchState(new options.screens.OptionMain()); 
                        }
                    });
                }
            }
        }
}/**
    What `CoolUtil.loadWeek()` tried to do, but nothing was made for it.

    @param weekID `Type: Int` The week number. If you're trying to load the first week, for example, you would put 0, because coders start counting at 0 :3
    @param difficulty `Type: String` The difficulty to play the week at
**/
function loadAndPlayStoryWeek(weekID:Int, difficulty:String) {
    PlayState.actualModWeek = storyWeek.weeks[weekID];
    PlayState.songMod = storyWeek.weeks[weekID].mod;
    PlayState.storyPlaylist = storyWeek.weeks[weekID].songs;
    PlayState.startTime = 0;
    PlayState.storyDifficulty = difficulty;
    CoolUtil.loadSong(mod, storyWeek.weeks[weekID].songs[0].toString(), difficulty);
    PlayState.storyWeek = weekID;
    PlayState.campaignScore = 0;
    PlayState.isStoryMode = true;
    LoadingState.loadAndSwitchState(new PlayState());
}
function playSongs() {
    // CoolUtil.loadSong(mod, "burning-in-hell", "hard");
    // LoadingState.loadAndSwitchState(new PlayState_());
    selectedSomethin = false;
    trace("not working rn");
    arrowMenu.alpha = 1;
}

function changeItem(huh:Int = 0) {
    
    menuCurSelected += huh;
	
    if (menuCurSelected >= menuItems.length)
		menuCurSelected = 0;
	if (menuCurSelected < 0)
		menuCurSelected = menuItems.length - 1;
    
    for (spr in menuItems) {
		spr.offset.y = 0;
		spr.updateHitbox();

		var daChoice:String = optionShit[menuCurSelected];

        for (spr in menuItems) {
			arrowMenu.x = spr.x - 80;	

			switch (daChoice) {
				case 'afton':
					arrowMenu.y = spr.y - 157.5;
				case 'extras':
					arrowMenu.y = spr.y - 105;
				case 'options':
					arrowMenu.y = spr.y - 49;
				case 'credits':
					arrowMenu.y = spr.y - 5;	
			}
		};	
	}
}
var curDifficulty:Int = 0;
var difficArray:Array<String> = ['easy','normal','hard'];
function changeDiff(huh:Int = 0) {
    curDifficulty += huh;

    if (curDifficulty >= 3)
        curDifficulty = 0;
    if (curDifficulty < 0)
        curDifficulty = 2;

    difficultyMenu.animation.play(difficArray[curDifficulty]);
    switch (curDifficulty)
    {
        case 1:
            difficultyMenu.x = 300;
        default:
            difficultyMenu.x = 325;
    }
}

function fazbarsPlay() {
	fazbarsCounter += 1;
	if(fazbarsCounter == 1987 && !fazbarsBeaten){
        // CoolUtil.loadSong(mod, "burning-in-hell", "hard");
        trace("IS THAT THE BITE OF '87??");
	}
}