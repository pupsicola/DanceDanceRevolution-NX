local t = Def.ActorFrame{};
t[#t+1] = 	LoadActor( THEME:GetPathB("_shared","models/DDRNoteGameplay") )..{
		OnCommand=cmd(zwrite,false;zoom,10;heartbeat;effectclock,'beat';effectmagnitude,1.0,1.01,1.0;);
};
return t;