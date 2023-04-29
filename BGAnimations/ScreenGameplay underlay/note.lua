local t = Def.ActorFrame{};
t[#t+1] = 	LoadActor( THEME:GetPathB("_shared","models/DDRNoteGameplay") )..{
		OnCommand=cmd(zwrite,false;zoom,12;heartbeat;effectclock,'beat';effectmagnitude,1.0,1.01,1.0;effectoffset,0.5;);
};
return t;