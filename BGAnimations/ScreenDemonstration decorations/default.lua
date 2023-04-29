local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathB("ScreenLogo", "decorations/3dlogo"))..{
		InitCommand=cmd(rotationx,-10;wag;effectmagnitude,0,0,2;effecttiming,5,0,5,0;x,SCREEN_CENTER_X+505;y,SCREEN_CENTER_Y+315;zoom,0.3;draworder,500;)
	}
};

--JacketBG
t[#t+1] = LoadActor("cd")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+240;y,SCREEN_CENTER_Y;zoom,1.1;diffusealpha,0;heartbeat;effectclock,'beat';effectmagnitude,1.0,1.01,1.0;effectoffset,0.5;);
	OnCommand=cmd(diffusealpha,1);
	OffCommand=cmd(diffusealpha,0;);
};

t[#t+1] = LoadActor("title")..{
	OnCommand=cmd(diffusealpha,0.5;x,SCREEN_RIGHT-140;y,SCREEN_TOP+34;draworder,1;zoom,0.7;diffuseblink;);
	OffCommand=cmd();
}

return t