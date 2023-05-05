local t = Def.ActorFrame{};

t[#t+1] = LoadActor("nxbg")..{
InitCommand=cmd(visible,ThemePrefs.Get("NXBG") == "On");
};

t[#t+1] = LoadActor("ScreenFilter");

return t;