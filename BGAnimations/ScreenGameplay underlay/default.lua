local t = Def.ActorFrame{};

if ThemePrefs.Get("FancyUIBG") then
	return Def.ActorFrame {
	

		LoadActor("blackbg") .. {
			OnCommand=cmd(zoom,1.3;Center;)
		};

		LoadActor("jacket") .. {
			OnCommand=cmd(Center;zoom,2.665;diffusealpha,0.25)
		};

		Def.ActorFrame{
		Name="Hot";
		Def.ActorFrame{
			Name="Heat";
			HealthStateChangedMessageCommand=function(self, param)
				if param.PlayerNumber == PLAYER_1 then
					if param.HealthState == "HealthState_Hot" then
						self:RunCommandsOnChildren(cmd(playcommand,"Show"))
					else
						self:RunCommandsOnChildren(cmd(playcommand,"Hide"))
					end
				end
			end;
			LoadActor("particlenormal") .. {
			InitCommand=cmd(diffusealpha,0;);
			ShowCommand=cmd(diffusealpha,0.25;);
			HideCommand=cmd(diffusealpha,0;);
		};
			LoadActor("_LoadingBar")..{
				InitCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;texcoordvelocity,0.2,0;Center;zoomx,3;zoomy,500;thump;effectclock,'beat';effectmagnitude,2,1,1;effectoffset,0;);
				ShowCommand=cmd(diffusealpha,0.05);
				HideCommand=cmd(diffusealpha,0);
			};
		}
		},

		Def.ActorFrame{
		Name="Danger";
		Def.ActorFrame{
			Name="Bad";
			HealthStateChangedMessageCommand=function(self, param)
				if param.PlayerNumber == PLAYER_1 then
					if param.HealthState == "HealthState_Danger" then
						self:RunCommandsOnChildren(cmd(playcommand,"Show"))
					else
						self:RunCommandsOnChildren(cmd(playcommand,"Hide"))
					end
				end
			end;
			LoadActor("_Danger")..{
				InitCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;texcoordvelocity,0.2,0;Center;zoomx,3;zoomy,500;thump;effectclock,'beat';effectmagnitude,2,1,1;effectoffset,0;);
				ShowCommand=cmd(diffusealpha,0.1);
				HideCommand=cmd(diffusealpha,0);
			};
		}
		},
		
		
		LoadActor("spiral") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X+200;y,SCREEN_CENTER_Y;diffusealpha,0.1;zoom,1.2;rotationx,-45;blend,'BlendMode_Add';effectperiod,10;spin;effectmagnitude,0,0,5)
		};
		
		LoadActor("halftone") .. {
		OnCommand=cmd(diffusealpha,0.25;texcoordvelocity,-0.01,0;Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;)
		};

		
		Def.ActorFrame{
			HealthStateChangedMessageCommand=function(self, param)
				if param.PlayerNumber == PLAYER_1 then
					if param.HealthState == "HealthState_Hot" then
						self:RunCommandsOnChildren(cmd(playcommand,"Show"))
					else
						self:RunCommandsOnChildren(cmd(playcommand,"Hide"))
					end
				end
			end;
			InitCommand=cmd(diffusealpha,0.1;fov,100;blend,'BlendMode_Add';x,SCREEN_CENTER_X+200;y,SCREEN_CENTER_Y-90;rotationx,-35;spin;effectmagnitude,0,0,2;effectclock,'beat';);
			LoadActor("note")..{
			OnCommand=cmd();
			ShowCommand=cmd(linear,1;diffusealpha,2;diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0.8;effectclock,'beat';);
			HideCommand=cmd(linear,1;diffusealpha,1;diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,1;effectclock,'beat';);
			};
		};

		LoadActor("flash") .. {
			OnCommand=cmd(diffusealpha,0.45;blend,'BlendMode_Add';zoom,1.3;Center;heartbeat;effectclock,'beat';effectmagnitude,2.0,1.01,1.0;effectoffset,0.5;)
		};
		
					LoadActor("rounded") .. {
		OnCommand=cmd(diffusealpha,1;Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;)
		};

		LoadActor("ScreenFilter");
		LoadActor("../ScreenGameplay Danger");
	}
else
	return 	LoadActor(THEME:GetPathG("common bg", "base")) .. {
		InitCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT)
	}
end

	--LoadActor("danger");
t[#t+1] = LoadActor("ScreenFilter");
--t[#t+1] = LoadActor("../ScreenGameplay Danger");

return t;