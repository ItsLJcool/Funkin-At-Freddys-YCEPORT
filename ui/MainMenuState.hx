//a
import flixel.effects.FlxFlicker;
import PlayState;
import CoolUtil;

// keys cool
var controls = FlxG.keys.pressed;
var controlsJust = FlxG.keys.justPressed;
var controlsJustNUM = FlxControls.anyJustPressed;
var controlsNUM = FlxControls.anyPressed;

var selectedSomethin:Bool = false;
var menuCurSelected:Int = 0;
var optionShit:Array<String> = ['afton', 'extras', 'options', 'credits'];

var menuItems:Array<FlxSprite> = [];
function create() {
}

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
    arrowMenu.scrollFactor.set(0, 0);
    arrowMenu.setGraphicSize(Std.int(arrowMenu.width * 0.6));
    arrowMenu.updateHitbox();
    arrowMenu.antialiasing = EngineSettings.antialiasing;
    add(arrowMenu);

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
    
    changeItem(0);
}

function update(elapsed:Float) {

    if (!selectedSomethin) {
        if (controlsJust.S)
            FlxG.switchState(new StoryMenuState());
            
        if (controlsJustNUM([87,38])) {
            CoolUtil.playMenuSFX(0);
            changeItem(-1); }

        if (controlsJustNUM([83,40])) {
            CoolUtil.playMenuSFX(0);
            changeItem(1); }

        if (controls.UI_LEFT_P)
            changeDiff(-1);

        if (controls.UI_RIGHT_P)
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
                                playSongs();
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
}
/**
    Loads the week within PlayState's shit and goes to it lmao
    !! Don't forget to import LoadingState and PlayState !!
    @param weekID `Int` The week number. If you're trying to load the first week, for example, you would put 0.
    @param difficulty `String` The week's difficulty.

    @ Thanks Xav!
**/
function playSongs() {
    // CoolUtil.loadSong(mod, "burning-in-hell", "hard");
    // LoadingState.loadAndSwitchState(new PlayState_());
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