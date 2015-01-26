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

while true do
  
  turbine.setActive(true)
  
  intake = (intake + ((lastSpeed - turbine.getRotorSpeed()) + (900 - turbine.getRotorSpeed())/10))
  
  turbine.setFluidFlowRateMax(intake)
  
  lastSpeed = turbine.getRotorSpeed()
  
  sleep(5)
end
