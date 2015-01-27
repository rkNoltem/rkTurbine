turbine = peripheral.find("BigReactors-Turbine")
monitor = peripheral.find("monitor")

local modemSide = nil
local periTable = peripheral.getNames()

for p=1,#periTable do
  if peripheral.getType(periTable[p]) == "modem" then
    if peripheral.call(periTable[p], "isWireless") then
      modem = peripheral.wrap(periTable[p])
      modemSide = periTable[p]
    end
  end
end

local intake = 0
local lastSpeed = 0

print([[rkTurbine  Copyright (C) 2015  Sean Harris
This program comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
This is free software, and you are welcome to redistribute it
under certain conditions.]])
sleep (10)
term.clear()

while true do
  
  turbine.setActive(true)
  
  intake = (intake + ((lastSpeed - turbine.getRotorSpeed()) + (900 - turbine.getRotorSpeed())/10))
  
  turbine.setFluidFlowRateMax(intake)
  
  lastSpeed = turbine.getRotorSpeed()
  
  sleep(5)
end

--[[
Big-Reactors turbine management code for ComputerCraft in Lua
Copyright (C) 2015  Sean Harris
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
You can contact the author at: ridleykiller1994@gmail.com]]
