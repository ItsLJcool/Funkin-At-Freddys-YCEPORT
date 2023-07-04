function create() {
    GameOverSubstate.scriptName = mod +  ":gameoverscripts/death";
    GameOverSubstate.firstDeathSFX = "die";
    GameOverSubstate.gameOverMusic = "death";
    GameOverSubstate.gameOverMusicBPM = 100;
    GameOverSubstate.retrySFX = "undie";
}