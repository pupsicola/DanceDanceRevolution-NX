local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame{
		Def.ActorFrame{
			InitCommand=cmd(x,SCREEN_CENTER_X;y,661+18;zoom,0.42);
			LoadActor("bg")..{
			};
		};
};

t[#t+1] = LoadFont("_@fot-newrodin pro db 30px")..{
		Text="Press Start";
		InitCommand=cmd(horizalign,center;shadowlengthy,2;x,SCREEN_CENTER_X;zoom,0.75;y,661+20;heartbeat;effectclock,'beat';effectmagnitude,1.0,1.01,1.0;effectoffset,0.5;);
				OffCommand=cmd(linear,0.25;diffusealpha,0;);
	 };
	 
return t