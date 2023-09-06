local sBannerPath = THEME:GetPathG("Common", "fallback jacket");
local sJacketPath = THEME:GetPathG("Common", "fallback jacket");
local bAllowJackets = true
local song;
local group;
--main backing

local t = Def.ActorFrame {


Def.Sprite {
		Name="GroupBG";
		InitCommand=cmd(x,120;scaletoclipped,538,538;croptop,0.435;cropbottom,0.435;fadeleft,1;diffusealpha,0.35);
		SetMessageCommand=function(self,params)
			-- group = params.Text;
			-- If the cached version is available, load that.
			if NXCachedGroupAreas[params.Text] then
				self:LoadFromCached("banner", NXCachedGroupAreas[params.Text] )
				return
			end
			-- Otherwise, we might need to generate it.
			-- local so = GAMESTATE:GetSortOrder();
			-- if group then
			-- 	LoadFromSelectionBG(self, group, so)
			-- else
			-- 	-- call fallback
			-- 	self:Load( THEME:GetPathG("","_No banner") );
			-- end;
		end;
	};

	LoadActor("MusicWheelItem SectionCollapsed NormalPart") .. {
	InitCommand=cmd(glowshift;);
};

	LoadActor("Folder")..{
	InitCommand=cmd(scaletoclipped,60,60;x,-238;);

};

--banner

Def.Sprite {
		Name="SongBanner";
		InitCommand=cmd(scaletoclipped,60,60;x,-235;);
		SetMessageCommand=function(self,params)
			-- group = params.Text;
			-- If the cached version is available, load that.
			if NXCachedGroupAreas[params.Text] then
				self:LoadFromCached("banner", NXCachedGroupAreas[params.Text] )
				return
			end
			-- local so = GAMESTATE:GetSortOrder();
			-- if group then
			-- 	LoadFromSelectionBG(self, group, so)
			-- else
			-- 	-- call fallback
			-- 	self:Load( THEME:GetPathG("","_No banner") );
			-- end;
		end;
	};

};

return t;