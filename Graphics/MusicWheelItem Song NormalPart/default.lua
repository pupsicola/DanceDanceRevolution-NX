local sBannerPath = THEME:GetPathG("Common", "fallback jacket");
local sJacketPath = THEME:GetPathG("Common", "fallback jacket");
local bAllowJackets = true
local song;
local group;
--main backing

local t = Def.ActorFrame {

	LoadActor(THEME:GetPathG("MusicWheelItem", "ModeItem")) .. {
};

	LoadActor("diff1") .. {
	OnCommand=cmd(x,-211;y,46;zoom,0.5);
	};
	
	LoadActor("grade1") .. {
	OnCommand=cmd(x,-168;zoom,0.71;);
	};



	LoadActor( "mask" )..{
		InitCommand=cmd(zoom,0.137;);
		OnCommand=cmd(x,-210;blend,'BlendMode_NoEffect';zwrite,true;clearzbuffer,false;);
		OffCommand=cmd();
	};
--banner
	Def.Sprite {
		Name="Banner";
		InitCommand=cmd(scaletoclipped,60,60;x,-210);
		BackgroundCommand=cmd(scaletoclipped,60,60);
		BannerCommand=cmd(scaletoclipped,60,60);
		JacketCommand=cmd(scaletoclipped,60,60);
		SetMessageCommand=function(self,params)
			local Song = params.Song;
			local Course = params.Course;
			if Song then
				if ( Song:GetJacketPath() ~=  nil ) and ( bAllowJackets ) then
					self:Load( Song:GetJacketPath() );
					self:playcommand("Jacket");
				elseif ( Song:GetBackgroundPath() ~= nil ) then
					self:Load( Song:GetBackgroundPath() );
					self:playcommand("Background");
				elseif ( Song:GetBannerPath() ~= nil ) and ( bAllowJackets ) then
					self:Load( Song:GetBannerPath() );
					self:playcommand("Banner");
				else
				  self:Load( bAllowJackets and sBannerPath or sJacketPath );
				  self:playcommand( bAllowJackets and "Jacket" or "Banner" );
				end;
			elseif Course then
				if ( Course:GetBackgroundPath() ~= nil ) and ( bAllowJackets ) then
					self:Load( Course:GetBackgroundPath() );
					self:playcommand("Jacket");
				elseif ( Course:GetBannerPath() ~= nil ) then
					self:Load( Course:GetBannerPath() );
					self:playcommand("Banner");
				else
					self:Load( sJacketPath );
					self:playcommand( bAllowJackets and "Jacket" or "Banner" );
				end
			else
				self:Load( bAllowJackets and sJacketPath or sBannerPath );
				self:playcommand( bAllowJackets and "Jacket" or "Banner" );
			end;
		end;
	};
};
return t;