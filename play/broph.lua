


local validSkins = {0, 1, 2, 7, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 66, 67, 68, 69, 70, 71, 72, 73, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312}


local function spawn(player)

	if player and isElement(player) then
		local x,y,z,r = unpack(spawnpoints[math.random(1,#spawnpoints)])

		spawnPlayer(player,1715.0522460938,-1874.3404541016, 13.566547393799,0,0,validSkins[math.random(1,#validSkins)],0,0)
		setCameraTarget(player,player)
		setTimer(function(source)
			if isElement(player) then
         setElementPosition(source,1715.0522460938,-1874.3404541016, 13.566547393799)
     end
	end,3000,1,source)
	end
end

local function onJoin()

	spawn(source)

end


local weapons = {}
 function SpawnJugador(totalAmmo, killer,  killerWeapon,  bodypart,  stealth)
	local p1,p2,p3 = getElementPosition(source)
	local cuentaJugador = getPlayerAccount(source)
    local skin = getElementModel(source)
    local int = getElementInterior(source) 
   local dimension = getElementDimension(source)
   local asesino = getPlayerName(killer) or "Nadie"
 
for i=1,12 do
	weapons[i] = { getPedWeapon( source, i ), getPedTotalAmmo( source, i ) }

end
      setAccountData( cuentaJugador, "armas.", toJSON( weapons ) )

      setElementData(source,"incosiente",true)
      setAccountData(cuentaJugador,"L",true)



       print("El dato se seteo a verdadero")
    outputChatBox("#FFFFFF"..asesino.." #B5561Bte acaba de domar.",source,255,255,255,true)
				   
		setTimer(function (source) -- Esta funciona establece la posiscion del jugador donde murio tomando su interior y dimension.
	    spawnPlayer(source,p1,p2,p3,0,skin,int,dimension)
	    local cuentaJugador = getPlayerAccount(source)
	    local armitas = fromJSON(getAccountData(cuentaJugador, "armas."))
         
		          local weaponTable = armitas
		     for i=1,12 do
		    local row = weaponTable[i]
		    if tonumber(row[2]) > 0 then
		        giveWeapon( source, row[1], row[2], true)
		    end
		     end
		      setAccountData( cuentaJugador, "armas.",false)


    
	    setPedAnimation(source,"CRACK","crckdeth3",-3,false,false,false,true,250,false)
	   
	     
	end,7000,1,source)
				  
end
addEventHandler("onPlayerWasted",root,SpawnJugador)





function JugadorLogeaMuerte()
	local cuentaJugador = getPlayerAccount(source)
	local key = getAccountData (cuentaJugador, "L" )
	print(cuentaJugador,key)
	if key == true then
		 setPedAnimation(source,"CRACK","crckdeth3",-3,false,false,false,true,250,false)
		 setElementData(source,"incosiente",true)
		
		end
end
addEventHandler("onPlayerLogin",root,JugadorLogeaMuerte)



function RevivirJugador(source,cmd,idjugador)
	if tonumber(idjugador) then
			local data, nombreData = exports["IDs"]:getPlayerFromID(idjugador)
			local x,y,z = getElementPosition(source) 
			local p1,p2,p3 = getElementPosition(data)
			if getDistanceBetweenPoints3D ( x,y,z,p1,p2,p3 ) < 3 then
				local cuentaData = getPlayerAccount(data)
			  setPedAnimation(source,"MEDIC","CPR",5000,false,false,false,true,250,false)

              setPedAnimation(data)
              setElementData(data,"incosiente",false)
              setAccountData(cuentaData,"L",false)
              print("El dato se seteo a falso")

			else
				outputChatBox("Estas demasiado largo del usuario.",source,255,0,0,true)
			end
		else
			outputChatBox("No encuentro ese usuario,",source,255,0,0,true)
	end
end

addCommandHandler("revivir",RevivirJugador,false,false)




pd = {}
function Poder(source)
   local x,y,z = getElementPosition(source);
   if isElement(pd[source]) then
   	destroyElement(pd[source])
   	pd[source] = createObject(4206,x,y,z);

   	setElementData(source,"suiton",true)
  
   else
  pd[source] = createObject(4206,x,y,z);
  setElementData(source,"suiton",true)


 
    setTimer(function()
  destroyElement(pd[source]);

 end,25000,1)
     end
 end  

addCommandHandler("agua",Poder,false,false)



