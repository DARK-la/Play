--  Variable para obtener la resoluecion.

function dxIncosiente()
   local screenW, screenH = guiGetScreenSize() 
  local px, py, pz, tx, ty, tz, dist
      px, py, pz = getCameraMatrix( )
    for _, v in ipairs(getElementsByType("player", getRootElement(), true)) do
       -- if v == getLocalPlayer() then else 
         tx, ty, tz = getElementPosition( v )
         dist = math.sqrt( ( px - tx ) ^ 2 + ( py - ty ) ^ 2 + ( pz - tz ) ^ 2 )
         if dist < 8 then
            if isLineOfSightClear( px, py, pz, tx, ty, tz, true, false, false, false, false, false, false, localPlayer ) then
               local sx, sy, sz = getPedBonePosition( v,6 )
               local x,y = getScreenFromWorldPosition( sx, sy, sz + 0.2 )

            
               if x then 
                if getElementData(v,"incosiente") == true then
              
          
            dxDrawText("Usuario incosiente", x - 1, y - 1, x - 1, y - 1, tocolor(0, 0, 0, 250), 0.97, "default-bold", "center", "center", false, false, false, false, false)
            dxDrawText("Usuario incosiente", x + 1, y - 1, x + 1, y - 1, tocolor(0, 0, 0, 250), 0.97, "default-bold", "center", "center", false, false, false, false, false)
            dxDrawText("Usuario incosiente", x - 1, y + 1, x - 1, y + 1, tocolor(0, 0, 0, 250), 0.97, "default-bold", "center", "center", false, false, false, false, false)
            dxDrawText("Usuario incosiente", x + 1, y + 1, x + 1, y + 1, tocolor(0, 0, 0, 250), 0.97, "default-bold", "center", "center", false, false, false, false, false)
            dxDrawText("#E3854CUsuario incosiente", x, y, x, y - 1, tocolor(255, 255,  255, 250), 0.97, "default-bold", "center", "center", false, false, false, true, false)

     
         end
        end
      end
    end
  end
end
addEventHandler("onClientRender", root, dxIncosiente) 



