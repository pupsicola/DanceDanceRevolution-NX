return Def.ActorFrame {
	StandardDecorationFromFileOptional("Clock","Clock");
	LoadActor("Back") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(zoomx,0;linear,0.25;zoomx,1);
		OffCommand=cmd(sleep,0.3;linear,0.25;zoomx,0);
	};
};