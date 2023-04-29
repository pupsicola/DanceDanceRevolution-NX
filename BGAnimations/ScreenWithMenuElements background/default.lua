local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
		LoadActor("blurbg") .. {
		OnCommand=cmd(diffusealpha,1;texcoordvelocity,0.03,0;Center;zoomto,2000,SCREEN_HEIGHT;)
		};
		
		LoadActor("blur") .. {
		OnCommand=cmd(diffusealpha,1;texcoordvelocity,0.05,0;Center;zoomto,2000,SCREEN_HEIGHT;)
		};
		
		LoadActor("spiral") .. {
		InitCommand=cmd(fov,120);
		OnCommand=cmd(Center;diffusealpha,0.1;rotationx,-45;blend,'BlendMode_Add';spin;effectmagnitude,0,0,5)
		};
		
		LoadActor("halftone") .. {
		OnCommand=cmd(diffusealpha,0.1;blend,'BlendMode_Add';texcoordvelocity,-0.01,0;Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;)
		};
		
		LoadActor("rounded") .. {
		OnCommand=cmd(diffusealpha,1;Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;)
		};
		
};



t[#t+1] = Def.ActorFrame{
		Def.ActorFrame{
			InitCommand=cmd(fov,100;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-70;rotationx,-35;spin;effectmagnitude,0,0,5;);
			LoadActor( THEME:GetPathB("_shared","models/DDRNote") )..{
			OnCommand=cmd(diffusealpha,0;zoom,10;heartbeat;effectclock,'beat';effectmagnitude,1.0,1.01,1.0;effectoffset,0.5;decelerate,1;diffusealpha,0.25;);
			};
		};
};

return t