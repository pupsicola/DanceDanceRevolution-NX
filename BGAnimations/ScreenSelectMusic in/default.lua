local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	LoadActor("music_in")..{
		OnCommand=cmd(play);
	};	
	LoadActor(THEME:GetPathB("","_door/loadingprofile"))..{
	InitCommand=cmd(x,1093;y,680;diffusealpha,1;);
	OnCommand=cmd(decelerate,0.25;addx,-50;diffusealpha,0;draworder,7;);
	};
};



return t