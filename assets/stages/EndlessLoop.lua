function onCreate()
makeAnimatedLuaSprite('static', 'funkinAVI/episode1/street/scratchShit', 0, 0);
addAnimationByPrefix('static', 'scratch thing 1', 'scratch thing 1', 24, true);
setScrollFactor('static', 0, 0);
addLuaSprite('static', true);
setObjectCamera('static', 'hud');
makeLuaSprite('street', 'funkinAVI/episode1/street/Mickeybg', -382, -409);
setScrollFactor('street', 1, 1);
setProperty('street.flipY', false);
setProperty('street.flipX', false);
scaleObject('street', 1.1, 1);
addLuaSprite('street', 'false');
addEffect1('street', 0.005);
addEffect5('street', 1, false, true, true);
addEffect5('game');
addEffect1('hud', 0.004);
addEffect5('hud');
addEffect4('hud', 0.5, 0);
addEffect4('game', 0.6, 0);
addEffect10('game');
addEffect11('hud');
end