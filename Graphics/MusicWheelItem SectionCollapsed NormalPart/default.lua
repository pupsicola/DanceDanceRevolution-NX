local sBannerPath = THEME:GetPathG("Common", "fallback jacket");
local sJacketPath = THEME:GetPathG("Common", "fallback jacket");
local bAllowJackets = true
local song;
local group;
--main backing

local t = Def.ActorFrame {

	LoadActor("MusicWheelItem SectionCollapsed NormalPart") .. {

};
--banner

Def.Banner {
		Name="SongBanner";
		InitCommand=cmd(scaletoclipped,60,60;x,-235;);
		SetMessageCommand=function(self,params)
					group = params.Text;
		local so = GAMESTATE:GetSortOrder();
			if group then
				if so =="SortOrder_Genre" then
					if group == "Pop" or group == "POP"  or group == "Pop" then
						self:Load(THEME:GetPathG("group jacket","Pop"));
					elseif group == "Anime/Game"  or group == "AnimeGame"  or group == "Anime"  or group == "Game" then
						self:Load(THEME:GetPathG("group jacket","AnimeGame"));
					elseif group == "Variety" then
						self:Load(THEME:GetPathG("group jacket","Variety"));
					elseif group == "GUMI 5th anniversary"  or group == "GUMI" then
						self:Load(THEME:GetPathG("group jacket","GUMI"));
					elseif group == "U.M.U. x BEMANI" or group == "UMU" then
						self:Load(THEME:GetPathG("group jacket","UMU"));
					elseif group == "KONAMI originals" or group == "KONAMI" then
						self:Load(THEME:GetPathG("group jacket","KONAMI"));	
						
					elseif group == "beatmania IIDX" or group == "beatmaniaIIDX" then
						self:Load(THEME:GetPathG("group jacket series","IIDX"));
					elseif group == "pop'n music" or group == "popn music" then
						self:Load(THEME:GetPathG("group jacket series","popn"));
					elseif group == "GITADORA" then
						self:Load(THEME:GetPathG("group jacket series","GITADORA"));
					elseif group == "jubeat" then
						self:Load(THEME:GetPathG("group jacket series","jubeat"));
					elseif group == "REFLEC BEAT" then
						self:Load(THEME:GetPathG("group jacket series","RB"));
					elseif group == "Dance Evolution" then
						self:Load(THEME:GetPathG("group jacket series","DanceEvolution"));
					elseif group == "SOUND VOLTEX" or group == "SDVX" then
						self:Load(THEME:GetPathG("group jacket series","SDVX"));
					elseif group == "FutureTomTom" then
						self:Load(THEME:GetPathG("group jacket series","FutureTomTom"));
					elseif group == "DDR" then
						self:Load(THEME:GetPathG("group jacket series","DDR"));
					elseif group == "BEMANI Academy" then
						self:Load(THEME:GetPathG("group jacket series","BEMANI Academy"));
					elseif group == "BEMANI STADIUM" or group == "BEMANI Stadium" then
						self:Load(THEME:GetPathG("group jacket series","BEMANI STADIUM"));
					elseif group == "HinaBitter" then
						self:Load(THEME:GetPathG("group jacket series","HinaBitter"));
					elseif group == "BEMANI x TOHO project" or group == "BEMANI x TOHO" then
						self:Load(THEME:GetPathG("group jacket series","BEMANI x TOHO project"));
					elseif group == "Dancemania" then
						self:Load(THEME:GetPathG("group jacket series","Dancemania"));	
					elseif group == "Electronic" or group == "Electronics" then
						self:Load(THEME:GetPathG("group jacket series","Electronic"));	
					elseif group=='N/A' or group=='- EMPTY -'then
						self:Load(THEME:GetPathG("group global","NA"));
					elseif FILEMAN:DoesFileExist("Themes/Genres/"..group..".png") then
						self:LoadBackground(THEME:GetPathG("","../../Genres/"..group..".png"));
					elseif FILEMAN:DoesFileExist("Themes/Genres/"..group..".jpg") then
						self:LoadBackground(THEME:GetPathG("","../../Genres/"..group..".jpg"));
					else
						self:Load( THEME:GetPathG("group jacket","NA") );
					end
				elseif string.find(so,"Meter") then
					if group=='01' then
						self:Load(THEME:GetPathG("group diff","01"));
					elseif group=='02' then
						self:Load(THEME:GetPathG("group diff","02"));
					elseif group=='03' then
						self:Load(THEME:GetPathG("group diff","03"));
					elseif group=='04' then
						self:Load(THEME:GetPathG("group diff","04"));
					elseif group=='05' then
						self:Load(THEME:GetPathG("group diff","05"));
					elseif group=='06' then
						self:Load(THEME:GetPathG("group diff","06"));
					elseif group=='07' then
						self:Load(THEME:GetPathG("group diff","07"));
					elseif group=='08' then
						self:Load(THEME:GetPathG("group diff","08"));
					elseif group=='09' then
						self:Load(THEME:GetPathG("group diff","09"));
					elseif group=='10' then
						self:Load(THEME:GetPathG("group diff","10"));
					elseif group=='11' then
						self:Load(THEME:GetPathG("group diff","11"));
					elseif group=='12' then
						self:Load(THEME:GetPathG("group diff","12"));
					elseif group=='13' then
						self:Load(THEME:GetPathG("group diff","13"));
					elseif group=='14' then
						self:Load(THEME:GetPathG("group diff","14"));
					elseif group=='15' then
						self:Load(THEME:GetPathG("group diff","15"));
					elseif group=='16' then
						self:Load(THEME:GetPathG("group diff","16"));
					elseif group=='17' then
						self:Load(THEME:GetPathG("group diff","17"));
					elseif group=='18' then
						self:Load(THEME:GetPathG("group diff","18"));
					elseif group=='19' then
						self:Load(THEME:GetPathG("group diff","19"));
					elseif group=='20' then
						self:Load(THEME:GetPathG("group diff","20"));
					else
						self:Load( THEME:GetPathG("group diff","NA") );
					end
				else
					if group=='A' then
						self:Load(THEME:GetPathG("group title","A"));
					elseif group=='B' then
						self:Load(THEME:GetPathG("group title","B"));
					elseif group=='C' then
						self:Load(THEME:GetPathG("group title","C"));
					elseif group=='D' then
						self:Load(THEME:GetPathG("group title","D"));
					elseif group=='E' then
						self:Load(THEME:GetPathG("group title","E"));
					elseif group=='F' then
						self:Load(THEME:GetPathG("group title","F"));
					elseif group=='G' then
						self:Load(THEME:GetPathG("group title","G"));
					elseif group=='H' then
						self:Load(THEME:GetPathG("group title","H"));
					elseif group=='I' then
						self:Load(THEME:GetPathG("group title","I"));
					elseif group=='J' then
						self:Load(THEME:GetPathG("group title","J"));
					elseif group=='K' then
						self:Load(THEME:GetPathG("group title","K"));
					elseif group=='L' then
						self:Load(THEME:GetPathG("group title","L"));
					elseif group=='M' then
						self:Load(THEME:GetPathG("group title","M"));
					elseif group=='N' then
						self:Load(THEME:GetPathG("group title","N"));
					elseif group=='O' then
						self:Load(THEME:GetPathG("group title","O"));
					elseif group=='P' then
						self:Load(THEME:GetPathG("group title","P"));
					elseif group=='Q' then
						self:Load(THEME:GetPathG("group title","Q"));
					elseif group=='R' then
						self:Load(THEME:GetPathG("group title","R"));
					elseif group=='S' then
						self:Load(THEME:GetPathG("group title","S"));
					elseif group=='T' then
						self:Load(THEME:GetPathG("group title","T"));
					elseif group=='U' then
						self:Load(THEME:GetPathG("group title","U"));
					elseif group=='V' then
						self:Load(THEME:GetPathG("group title","V"));
					elseif group=='W' then
						self:Load(THEME:GetPathG("group title","W"));
					elseif group=='X' then
						self:Load(THEME:GetPathG("group title","X"));
					elseif group=='Y' then
						self:Load(THEME:GetPathG("group title","Y"));
					elseif group=='Z' then
						self:Load(THEME:GetPathG("group title","Z"));
					elseif group=='0-9' then
						self:Load(THEME:GetPathG("group title","0-9"));					
						
					
					elseif group=='000-019' then
						self:Load(THEME:GetPathG("group bpm","000"));
					elseif group=='020-039' then
						self:Load(THEME:GetPathG("group bpm","020"));
					elseif group=='040-059' then
						self:Load(THEME:GetPathG("group bpm","040"));
					elseif group=='060-079' then
						self:Load(THEME:GetPathG("group bpm","060"));	
					elseif group=='080-099' then
						self:Load(THEME:GetPathG("group bpm","080"));
						
					elseif group=='100-119' then
						self:Load(THEME:GetPathG("group bpm","100"));
					elseif group=='120-139' then
						self:Load(THEME:GetPathG("group bpm","120"));
					elseif group=='140-159' then
						self:Load(THEME:GetPathG("group bpm","140"));
					elseif group=='160-179' then
						self:Load(THEME:GetPathG("group bpm","160"));	
					elseif group=='180-199' then
						self:Load(THEME:GetPathG("group bpm","180"));
						
					elseif group=='200-219' then
						self:Load(THEME:GetPathG("group bpm","200"));
					elseif group=='220-239' then
						self:Load(THEME:GetPathG("group bpm","220"));
					elseif group=='240-259' then
						self:Load(THEME:GetPathG("group bpm","240"));
					elseif group=='260-279' then
						self:Load(THEME:GetPathG("group bpm","260"));	
					elseif group=='280-299' then
						self:Load(THEME:GetPathG("group bpm","280"));
						
					elseif group=='300-319' then
						self:Load(THEME:GetPathG("group bpm","300"));
					elseif group=='320-339' then
						self:Load(THEME:GetPathG("group bpm","320"));
					elseif group=='340-359' then
						self:Load(THEME:GetPathG("group bpm","340"));
					elseif group=='360-379' then
						self:Load(THEME:GetPathG("group bpm","360"));	
					elseif group=='380-399' then
						self:Load(THEME:GetPathG("group bpm","380"));
						
					elseif group=='400-419' then
						self:Load(THEME:GetPathG("group bpm","400"));
					elseif group=='420-439' then
						self:Load(THEME:GetPathG("group bpm","420"));
					elseif group=='440-459' then
						self:Load(THEME:GetPathG("group bpm","440"));
					elseif group=='460-479' then
						self:Load(THEME:GetPathG("group bpm","460"));	
					elseif group=='480-499' then
						self:Load(THEME:GetPathG("group bpm","480"));

					elseif group=='500-519' then
						self:Load(THEME:GetPathG("group bpm","500"));
					elseif group=='520-539' then
						self:Load(THEME:GetPathG("group bpm","520"));
					elseif group=='540-559' then
						self:Load(THEME:GetPathG("group bpm","540"));
					elseif group=='560-579' then
						self:Load(THEME:GetPathG("group bpm","560"));	
					elseif group=='580-599' then
						self:Load(THEME:GetPathG("group bpm","580"));

					elseif group=='600-619' then
						self:Load(THEME:GetPathG("group bpm","600"));
					elseif group=='620-639' then
						self:Load(THEME:GetPathG("group bpm","620"));
					elseif group=='640-659' then
						self:Load(THEME:GetPathG("group bpm","640"));
					elseif group=='660-679' then
						self:Load(THEME:GetPathG("group bpm","660"));	
					elseif group=='680-699' then
						self:Load(THEME:GetPathG("group bpm","680"));

					elseif group=='700-719' then
						self:Load(THEME:GetPathG("group bpm","700"));
					elseif group=='720-739' then
						self:Load(THEME:GetPathG("group bpm","720"));
					elseif group=='740-759' then
						self:Load(THEME:GetPathG("group bpm","740"));
					elseif group=='760-779' then
						self:Load(THEME:GetPathG("group bpm","760"));	
					elseif group=='780-799' then
						self:Load(THEME:GetPathG("group bpm","780"));

					elseif group=='800-819' then
						self:Load(THEME:GetPathG("group bpm","800"));
					elseif group=='820-839' then
						self:Load(THEME:GetPathG("group bpm","820"));
					elseif group=='840-859' then
						self:Load(THEME:GetPathG("group bpm","840"));
					elseif group=='860-879' then
						self:Load(THEME:GetPathG("group bpm","860"));	
					elseif group=='880-899' then
						self:Load(THEME:GetPathG("group bpm","880"));

					elseif group=='900-919' then
						self:Load(THEME:GetPathG("group bpm","900"));
					elseif group=='920-939' then
						self:Load(THEME:GetPathG("group bpm","220"));
					elseif group=='940-959' then
						self:Load(THEME:GetPathG("group bpm","940"));
					elseif group=='960-979' then
						self:Load(THEME:GetPathG("group bpm","960"));	
					elseif group=='980-999' then
						self:Load(THEME:GetPathG("group bpm","980"));
						
					elseif group=='1000-1019' then
						self:Load(THEME:GetPathG("group bpm","a1000"));
						
					elseif group=="AAAA x 9" or group=="AAAA x 8" or group=="AAAA x 7" or group=="AAAA x 6" or group=="AAAA x 5" or group=="AAAA x 4" or group=="AAAA x 3" or group=="AAAA x 2" or group=="AAAA x 1" then
						self:Load(THEME:GetPathG("group grade","3A"));
					elseif group==" AAA x 9" or group==" AAA x 8" or group==" AAA x 7" or group==" AAA x 6" or group==" AAA x 5" or group==" AAA x 4" or group==" AAA x 3" or group==" AAA x 2" or group==" AAA x 1" then
						self:Load(THEME:GetPathG("group grade","2A"));
					elseif group=="  AA x 9" or group=="  AA x 8" or group=="  AA x 7" or group=="  AA x 6" or group=="  AA x 5" or group=="  AA x 4" or group=="  AA x 3" or group=="  AA x 2" or group=="  AA x 1" then
						self:Load(THEME:GetPathG("group grade","A"));
					elseif group=="   A x 9" or group=="   A x 8" or group=="   A x 7" or group=="   A x 6" or group=="   A x 5" or group=="   A x 4" or group=="   A x 3" or group=="   A x 2" or group=="   A x 1" then
						self:Load(THEME:GetPathG("group grade","B"));
					elseif group=="   B x 9" or group=="   B x 8" or group=="   B x 7" or group=="   B x 6" or group=="   B x 5" or group=="   B x 4" or group=="   B x 3" or group=="   B x 2" or group=="   B x 1" then
						self:Load(THEME:GetPathG("group grade","C"));
					elseif group=="   C x 9" or group=="   C x 8" or group=="   C x 7" or group=="   C x 6" or group=="   C x 5" or group=="   C x 4" or group=="   C x 3" or group=="   C x 2" or group=="   C x 1" then
						self:Load(THEME:GetPathG("group grade","D"));
					elseif group=="   D x 9" or group=="   D x 8" or group=="   D x 7" or group=="   D x 6" or group=="   D x 5" or group=="   D x 4" or group=="   D x 3" or group=="   D x 2" or group=="   D x 1" then
						self:Load(THEME:GetPathG("group grade","D"));
						
						
					elseif group=="???" then
						if so == "SortOrder_TopGrades" then
						self:Load(THEME:GetPathG("group cleared rank","unplayed"));
						end;
					elseif group=='N/A' or group=='- EMPTY -'then
						self:Load(THEME:GetPathG("group global","NA"));	
					
					elseif group=='Nonstop'then
						self:Load(THEME:GetPathG("group COURSE","NORMAL"));
					elseif group=='Oni'then
						self:Load(THEME:GetPathG("group COURSE","CHALLENGE"));
						
						
					elseif group=='DanceDanceRevolution 1stMIX' or group=='01 - DDR 1st' then
					self:Load(THEME:GetPathG("group","001 DDR"));
					elseif group=='DanceDanceRevolution 2ndMIX' or group=='02 - DDR 2ndMIX' then
					self:Load(THEME:GetPathG("group","002 DDR 2ndMIX"));
					elseif group=='DanceDanceRevolution 3rdMIX' or group=='03 - DDR 3rdMIX' then
					self:Load(THEME:GetPathG("group","003 DDR 3rdMIX"));
					elseif group=='DanceDanceRevolution 4thMIX' or group=='04 - DDR 4thMIX'  then
					self:Load(THEME:GetPathG("group","004 DDR 4thMIX"));	
					elseif group=='DanceDanceRevolution 5thMIX' or group=='05 - DDR 5thMIX'  then
					
					self:Load(THEME:GetPathG("group","005 DDR 5thMIX"));	
					elseif group=='DanceDanceRevolution 6thMIX MAX' or group=='06 - DDR MAX'  then
					
					self:Load(THEME:GetPathG("group","006 DDRMAX"));	
					elseif group=='DanceDanceRevolution 7thMIX MAX2' or group=='07 - DDR MAX2'  then
					
					self:Load(THEME:GetPathG("group","007 DDRMAX2"));	
					elseif group=='DanceDanceRevolution 8thMIX EXTREME' or group=='08 - DDR EXTREME'  then
					
					self:Load(THEME:GetPathG("group","008 DDR EXTREME"));	
					elseif group=='DanceDanceRevolution SuperNOVA' or group=='09 - DDR SuperNOVA'  then
					
					self:Load(THEME:GetPathG("group","009 DDR SuperNOVA"));
					elseif group=='DanceDanceRevolution SuperNOVA2' or group=='10 - DDR SuperNOVA2'  then
					
					self:Load(THEME:GetPathG("group","010 DDR SuperNOVA2"));
					elseif group=='DanceDanceRevolution X' or group=='11 - DDR X'  then
					
					self:Load(THEME:GetPathG("group","011 DDR X"));
					elseif group=='DanceDanceRevolution X2' or group=='12 - DDR X2'  then
					
					self:Load(THEME:GetPathG("group","012 DDR X2"));
					elseif group=='DanceDanceRevolution X3' or group=='13 - DDR X3 vs 2ndMIX'  then
					
					self:Load(THEME:GetPathG("group","013 DDR X3 vs 2ndMIX"));
					elseif group=='DDR 2013' or group=='14 - DDR 2013'  then
					
					self:Load(THEME:GetPathG("group","014 DDR 2013"));
					elseif group=='DDR 2014' or group=='15 - DDR 2014'  then
					self:Load(THEME:GetPathG("group","015 DDR 2014"));
					else
					self:LoadFromSongGroup(group);
	
					end
			
				end
			else
				
				-- call fallback
				self:Load( THEME:GetPathG("","_No banner") );
			end;

		end;
	};

};

return t;