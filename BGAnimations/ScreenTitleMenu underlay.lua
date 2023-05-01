local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame {
InitCommand=cmd();
		LoadActor( "ScreenLogo decorations/3dlogo" )..{
		InitCommand=cmd(rotationx,-10;wag;effectmagnitude,0,0,2;effecttiming,5,0,5,0;x,SCREEN_CENTER_X+15;y,SCREEN_CENTER_Y-20;zoom,1.1;draworder,500;);
		OffCommand=cmd(decelerate,0.5;zoom,1.4;diffusealpha,0;);
	};
};

t[#t+1] = LoadFont("_@fot-newrodin pro db 30px")..{
		Text="Pre-release Beta 1.1";
		InitCommand=cmd(horizalign,left;diffuse,color("1,1,1,1");shadowlength,1;x,18;zoom,0.45;y,661+40);
				OffCommand=cmd(linear,0.25;diffusealpha,0;);
	 };

	t[#t+1] = Def.ActorFrame {
		LoadActor(THEME:GetPathB("","_Arcade decorations/bg"))..{
			OnCommand=cmd(zoom,0.8;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+190);
					OffCommand=cmd(linear,0.25;diffusealpha,0;);
		};
	};

	t[#t+1] = Def.ActorFrame {
		LoadActor(THEME:GetPathB("","_Arcade decorations/yoshi"))..{
			OnCommand=cmd(zoom,0.6;x,SCREEN_CENTER_X+600;y,SCREEN_BOTTOM+50;sleep,0.5;decelerate,0.25;y,SCREEN_BOTTOM-40;linear,0.1;y,SCREEN_BOTTOM-36;);
					OffCommand=cmd(linear,0.25;diffusealpha,0;);
		};
	};


t[#t+1] = LoadFont("_@fot-newrodin pro db 30px")..{
		Text="DDR © Konami";
		InitCommand=cmd(horizalign,right;diffuse,color("1,1,1,1");shadowlength,1;y,70;x,1195;zoom,0.45;y,661);
				OffCommand=cmd(linear,0.25;diffusealpha,0;);
	 };
	 
t[#t+1] = LoadFont("_@fot-newrodin pro db 30px")..{
		Text="Theme by pupsi";
		InitCommand=cmd(horizalign,right;diffuse,color("1,1,1,1");shadowlength,1;x,1195;zoom,0.45;y,661+20);
				OffCommand=cmd(linear,0.25;diffusealpha,0;);
	 };
t[#t+1] = LoadFont("_@fot-newrodin pro db 30px")..{
		Text="Base DDR A theme code by MadkaT, Risk, pkwp, and KENp";
		InitCommand=cmd(horizalign,right;diffuse,color("1,1,1,1");shadowlength,1;x,1195;zoom,0.45;y,661+40);
				OffCommand=cmd(linear,0.25;diffusealpha,0;);
	 };

t[#t+1] = Def.ActorFrame {
InitCommand=cmd();
	LoadActor( "ScreenWithMenuElements background/rounded" )..{
		OnCommand=cmd(diffusealpha,1;Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;)
	};
};

t[#t+1] = StandardDecorationFromFileOptional("Clock","Clock")..{
InitCommand=cmd(visible,ThemePrefs.Get("ScreenClock") == "On");
};


return t
