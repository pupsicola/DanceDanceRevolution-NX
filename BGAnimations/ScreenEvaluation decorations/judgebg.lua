local t = Def.ActorFrame {};


t[#t+1] = LoadActor("judgment");

if ThemePrefs.Get("SlowFast") == "Off" then
	if ThemePrefs.Get("SlowFast") == "On" then
		t[#t+1] = LoadActor("timingbg");
	end
end

return t;