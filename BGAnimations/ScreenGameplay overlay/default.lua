local t = Def.ActorFrame{};



t[#t+1] = Def.ActorFrame{
	Def.ActorFrame{
		InitCommand=cmd(x,SCREEN_LEFT+270;y,SCREEN_TOP+50;draworder,2;);

		Def.SongMeterDisplay{
			InitCommand=cmd(SetStreamWidth,421;zoomy,1.4;y,3;);
			Stream=LoadActor("meter stream");
			Tip=LoadActor("tip")..{
				OnCommand=cmd(zoom,0;sleep,1.8;zoom,1;diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("1,1,1,.5");effectclock,"beat";effectperiod,4;);
			};
		};
	};


};


t[#t+1] = LoadActor("frame")..{
		InitCommand=cmd(x,SCREEN_LEFT+273;y,SCREEN_TOP+25;zoom,1;);
		OnCommand=cmd(addy,-100;decelerate,2;addy,100);
};




for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	t[#t+1] = LoadActor("FullCombo", pn) .. {
	};
end;

t[#t+1] = LoadActor("OniGameOverDisplay");


return t;