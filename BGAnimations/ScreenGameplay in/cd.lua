local t = Def.ActorFrame{};

--JacketBG
t[#t+1] = LoadActor("cdbg")..{
	InitCommand=cmd();
	OnCommand=cmd(diffusealpha,1);
	OffCommand=cmd();
};




--Jacket
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(y,-40+12+15;draworder,1;diffusealpha,1;zoom,1.1;zoom,1;diffusealpha,1);
	Def.Sprite {
		OnCommand=function (self)
			local course = GAMESTATE:GetCurrentCourse();
			if GAMESTATE:IsCourseMode() then
				if course:GetBackgroundPath() then
					self:Load(course:GetBackgroundPath())
					self:setsize(300,300);
				else
					self:Load(THEME:GetPathG("", "Common fallback jacket"));
					self:setsize(300,300);
				end;
			else
			local song = GAMESTATE:GetCurrentSong();
				if song then
					if song:HasJacket() then
						self:LoadBackground(song:GetJacketPath());
						self:setsize(300,300);
					elseif song:HasBackground() then
						self:LoadFromSongBackground(GAMESTATE:GetCurrentSong());
						self:setsize(300,300);
					else
						self:Load(THEME:GetPathG("","Common fallback jacket"));
						self:setsize(300,300);
					end;
				else
					self:diffusealpha(1);
			end;
		end;
		end;
	OffCommand=cmd();
	};
};


--songinfo--
t[#t+1] = LoadFont("_@fot-newrodin pro db 30px")..{
	InitCommand=cmd(horizalign,center;y,141+15+15;zoom,0.8;draworder,50;shadowlength,2;);
	OnCommand=cmd(diffusealpha,1);
	OffCommand=cmd();
	CurrentSongChangedMessageCommand=function(self)
	if   GAMESTATE:GetCurrentStage() ~= 'Stage_Demo' then
		local song = GAMESTATE:GetCurrentSong();
		if song then
			local text = song:GetDisplayFullTitle();
				self:diffusealpha(1);
				self:maxwidth(370);
				self:settext(text);
			end;
		end;
	end;
};
--artist--
t[#t+1] = LoadFont("_@fot-newrodin pro db 30px")..{
	InitCommand=cmd(horizalign,center;y,167+22+15;zoom,0.6;draworder,50;shadowlength,2;);
	OnCommand=cmd(diffusealpha,0.5);
	OffCommand=cmd();
	CurrentSongChangedMessageCommand=function(self)
	if   GAMESTATE:GetCurrentStage() ~= 'Stage_Demo' then
		local song = GAMESTATE:GetCurrentSong();
		if song then
		local text = song:GetDisplayArtist();
			self:diffusealpha(0.5);
			self:maxwidth(450);
			self:settext(text);
		end;
		end;
	end;
};

	
return t