function init()
  self.powerModifier = config.getParameter("powerModifier", 0)
  baseValue = config.getParameter("healthBonus",0)*(status.resourceMax("health"))
  baseValue2 = config.getParameter("energyBonus",0)*(status.resourceMax("energy"))
  local bounds = mcontroller.boundBox()
  
  effect.addStatModifierGroup({
    {stat = "powerMultiplier", baseMultiplier = 1.0 + self.powerModifier},
    {stat = "maxHealth", amount = baseValue },
    {stat = "maxEnergy", amount = baseValue2 },
    {stat = "physicalResistance", amount = 0},
    {stat = "fireResistance", amount = -0.3},
    {stat = "iceResistance", amount = 0},
    {stat = "electricResistance", amount = -0.3},
    {stat = "poisonResistance", amount = 0},
    {stat = "shadowResistance", amount = 0}  
  })

  script.setUpdateDelta(10)
  
    if (world.type() == "savannah") then
	    status.setPersistentEffects("jungleEpic", {
	      {stat = "powerMultiplier", baseMultiplier = 1.10}
	    })
    end     
end

function update(dt)

end

function uninit()
  status.clearPersistentEffects("jungleEpic")
end