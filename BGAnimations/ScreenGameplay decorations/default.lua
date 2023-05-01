local t = LoadFallbackB()


local customscore=GetCustomScoreMode();
 local cscore="SuperNOVA2";
 if not GAMESTATE:IsCourseMode() then
 local stepcnt={0,0}
 t[#t+1] = Def.Actor{
     JudgmentMessageCommand = function(self, params)
		if STATSMAN:GetCurStageStats():GetPlayerStageStats(params.Player):GetFailed() == false then
         if params.TapNoteScore and
          params.TapNoteScore ~= 'TapNoteScore_AvoidMine' and
          params.TapNoteScore ~= 'TapNoteScore_HitMine' and
          params.TapNoteScore ~= 'TapNoteScore_CheckpointMiss' and
          params.TapNoteScore ~= 'TapNoteScore_CheckpointHit' and
          params.TapNoteScore ~= 'TapNoteScore_None'
         then
             if customscore=="old" then
                 Scoring[scoreType](params, 
                     STATSMAN:GetCurStageStats():GetPlayerStageStats(params.Player))
             elseif customscore=="5b2" then
                 local pn=((params.Player==PLAYER_1) and 1 or 2);
                 stepcnt[pn]=stepcnt[pn]+1;
                 CustomScore_SM5b2(params,cscore,GAMESTATE:GetCurrentSteps(params.Player),stepcnt[pn]);
             elseif customscore=="5b1" then
                 local pn=((params.Player==PLAYER_1) and 1 or 2);
                 stepcnt[pn]=stepcnt[pn]+1;
                 CustomScore_SM5b1(params,cscore,GAMESTATE:GetCurrentSteps(params.Player),stepcnt[pn]);
             else
                 local pn=((params.Player==PLAYER_1) and 1 or 2);
                 stepcnt[pn]=stepcnt[pn]+1;
                 CustomScore_SM5a2(params,cscore,GAMESTATE:GetCurrentSteps(params.Player),stepcnt[pn]);
             end;
         end
		 end
     end;
     InitCommand=function(self)
         if customscore=="non" then
             CustomScore_SM5a2_Init();
         end;
     end;
     OffCommand=function(self)
         if customscore=="non" then
             CustomScore_SM5a2_Out();
         end;
     end;
 };
 end;
 

t[#t+1] = LoadActor("OptionsHack.lua")..{
	InitCommand=cmd(draworder,1);
};



if ReadPrefFromFile("UserPrefGameplayShowFastSlow") ~= nil then
	if GetUserPrefB("UserPrefGameplayShowFastSlow") then
		t[#t+1] = LoadActor("TimingJudgements.lua")..{
			InitCommand=cmd(draworder,1);
		};
	end
end

--Song Options 

t[#t+1] = Def.BitmapText {
		Font = "Common Condensed",
		InitCommand=cmd(draworder,5;horizalign,left;x,260-132;y,648;zoom,0.5;diffusealpha,0;sleep,2;linear,0.5;diffusealpha,0.5;),
		OnCommand=function(self)
			self:settext(GAMESTATE:GetPlayerState(1):GetPlayerOptionsString(0))
			end;		
		};

t[#t+1] = Def.BitmapText {
		Font = "Common Condensed",
		InitCommand=cmd(draworder,5;horizalign,left;x,160-115;y,648;zoom,0.5;diffusealpha,0;sleep,2;linear,0.5;diffusealpha,0.75;),
		OnCommand=function(self)
			self:settext("Song Options:")
			end;	
		};

--JacketBG
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(visible,ThemePrefs.Get("NowPlayingOverlay") == "On");
	LoadActor("cd")..{
	InitCommand=cmd(x,SCREEN_CENTER_X+240;y,SCREEN_CENTER_Y;zoom,1.1;diffusealpha,0;heartbeat;effectclock,'beat';effectmagnitude,1.0,1.01,1.0;effectoffset,0.5;);
	OnCommand=cmd(sleep,5;linear,0.2;diffusealpha,1);
};
};

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(visible,ThemePrefs.Get("NowPlayingOverlay") == "Off");
	LoadActor("cd")..{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-270;zoom,0.3;diffusealpha,0;heartbeat;effectclock,'beat';effectmagnitude,1.0,1.01,1.0;effectoffset,0.5;);
	OnCommand=cmd(sleep,5;linear,0.2;diffusealpha,1);
};
};

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(draworder,1);
	StandardDecorationFromFileOptional("ScoreFrameP1","ScoreFrameP1");
	StandardDecorationFromFileOptional("StageFrame","StageFrame");
	StandardDecorationFromFileOptional("StageDisplay","StageDisplay");
	StandardDecorationFromFileOptional("SongTitle","SongTitle");
};
	


local showCal = false;

if ReadPrefFromFile("UserPrefGameplayShowCalories") ~= nil then
	if GetUserPrefB("UserPrefGameplayShowCalories") then
		showCal = true;
	else
		showCal = false;
	end
end
--MeterP1
if GAMESTATE:IsPlayerEnabled(PLAYER_1) and showCal == false then
--BG--
	t[#t+1] = LoadActor("diffmain")..{
		InitCommand=cmd(player,PLAYER_1;x,SCREEN_LEFT+198;y,SCREEN_CENTER_Y+295-40;zoom,0.0;draworder,50;);
		OnCommand=function(self)
			local diffP1 = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty();
			local sDifficulty = ToEnumShortString( diffP1 );
			self:diffuse(CustomDifficultyToColor( sDifficulty ));
			self:diffusetopedge(CustomDifficultyToDarkColor(sDifficulty));
		end;
		CurrentSongChangedMessageCommand=function(self)
			if GAMESTATE:IsCourseMode() then
				local diffP1 = GAMESTATE:GetCurrentTrail(PLAYER_1):GetTrailEntry(GAMESTATE:GetCourseSongIndex()):GetSteps():GetDifficulty();
				local sDifficulty = ToEnumShortString( diffP1 );
				self:diffuse(CustomDifficultyToColor( sDifficulty ));
				self:diffusetopedge(CustomDifficultyToDarkColor(sDifficulty));
			end;
		end;
	};
	t[#t+1] = LoadActor("diffmask")..{
		InitCommand=cmd(player,PLAYER_1;x,SCREEN_LEFT+198;y,SCREEN_CENTER_Y+295-40;zoom,1.5;draworder,50;);
		OnCommand=function(self)
			self:diffuse(color("0,0,0,1"));
		end;
		CurrentSongChangedMessageCommand=function(self)
			if GAMESTATE:IsCourseMode() then
				self:diffuse(color("0,0,0,1"));
			end;
		end;
	};

--PLAYER1 DisplayName--

t[#t+1] = LoadFont("_sf rounded pro 28px")..{

			InitCommand=function(self)

				local dispnameP1 = PROFILEMAN:GetProfile(PLAYER_1):GetDisplayName();
				local dispnamelengthP1 = string.len(dispnameP1);

				self:player(PLAYER_1);
				self:horizalign(center);
				self:settext(dispnameP1);

				local st_allsteps = "";
				--int NoteData::GetNumTapNotes 	(  	int  	iStartIndex = 0,
		--int  	iEndIndex = MAX_NOTE_ROW
	--)  	const


				--self:settext(st_allsteps);


				self:x(SCREEN_CENTER_X-370-30+15+180);self:y(SCREEN_CENTER_Y+276+84-38+102);
				self:draworder(50);
				self:diffuse(color("#FFFFFF"));
				self:zoom(0.75);
				self:decelerate(2);
				self:addy(-100);

				if dispnamelengthP1 >= 8 then
					--expand
					self:maxwidth(150);
					self:zoom(0.75);
				else
					--constant width
					self:zoom(0.75);
				end;

			end;


	};

--calculate (stepstype + meter) width P1--
local sDiffWidthP1 = 0;
local sMeterWidthP1 = 0;
local diffP1 = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty();
local sDifficulty = ToEnumShortString( diffP1 );
local meterP1 = tonumber(GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter());

if meterP1 <= 0 then
	sMeterWidthP1 = 18;
elseif meterP1 <= 9 then
	sMeterWidthP1 = 18 ;
elseif meterP1 <= 99 then
	sMeterWidthP1 = 0;
else
	sMeterWidthP1 = -18;
end;

if sDifficulty == 'Beginner' then
	sDiffWidthP1 = 85;
elseif sDifficulty == 'Easy' then
	sDiffWidthP1 = 52;
elseif sDifficulty == 'Medium' then
	sDiffWidthP1 = 84;
elseif sDifficulty == 'Hard' then
	sDiffWidthP1 = 62;
elseif sDifficulty == 'Challenge' then
	sDiffWidthP1 = 86;
else
	sDiffWidthP1 = 40;
end;

local totalWidthP1 = sDiffWidthP1 + sMeterWidthP1;
local additionXPosP1 = totalWidthP1 / 2 - 42;

--stepstype P1--
t[#t+1] = LoadFont("_sf rounded pro 28px")..{

	InitCommand=function(self)
		local diffP1 = GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty();
		local sDifficulty = ToEnumShortString( diffP1 );

		self:player(PLAYER_1);
		self:horizalign(right);
		if sDifficulty == 'Beginner' then
			self:settext("Beginner");
		elseif sDifficulty == 'Easy' then
			self:settext("Basic");
		elseif sDifficulty == 'Medium' then
			self:settext("Difficult");
		elseif sDifficulty == 'Hard' then
			self:settext("Expert");
		elseif sDifficulty == 'Challenge' then
			self:maxwidth(126);
			self:settext("Challenge");
		else
			self:settext("Edit");
		end;
		
		self:x(SCREEN_CENTER_X-370-130-20-5+additionXPosP1);
		self:y(SCREEN_CENTER_Y+276.0+86-40+102);
		self:maxwidth(95);	
		self:draworder(50);
		self:diffuse(CustomDifficultyToColor( sDifficulty ));
		self:zoomy(0.75);
		self:zoomx(0.75);
			self:decelerate(2);
			self:addy(-100);
	end;
	

};

--number--
t[#t+1] = LoadFont("_sf rounded pro 28px")..{
			InitCommand=cmd(player,PLAYER_1;horizalign,left;x,SCREEN_CENTER_X-370-30+27-15-120-12+additionXPosP1;y,SCREEN_CENTER_Y+276+84+2-40+102;draworder,50;diffuse,color("#ffffff");zoom,0.75;decelerate,2;addy,-100;);
			OnCommand=function(self)

				local meterP1 = GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter();
				self:settext(meterP1);
			end;
			CurrentSongChangedMessageCommand=function(self)
				if GAMESTATE:IsCourseMode() then
					local meterP1 = GAMESTATE:GetCurrentTrail(PLAYER_1):GetTrailEntry(GAMESTATE:GetCourseSongIndex()):GetSteps():GetMeter();
					self:settext(meterP1);
				end;
			end;
};
end;



--PERFECT COUNT P1
if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
	t[#t+1] = LoadActor("pfcount")..{

		InitCommand = function(self)
			self:player(PLAYER_1);
			self:x(SCREEN_LEFT+100);
			self:y(SCREEN_CENTER_Y-60);
			--self:zoom(0.4);
			self:zoom(0);
			self:draworder(2);
		end;
	
	}
end;




return t