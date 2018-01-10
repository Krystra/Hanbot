local myHero =objmanager.player
local Dive = module.load("Kloader", "Lib/TurretDive")

local R ={
    range = 625,
    Slot = player:spellslot(3),
}


function R.Cast(obj)
    if not R.IsR1() or not R.Ready() or Dive.DiveLogic(obj.pos)== false  then return end
    if obj then
        if(vec3.dist(myHero.pos,obj.pos)) < R.range  then
            game.cast("obj",3,obj)
        end
    end

end
function R.CastR2()
    if not R.Ready() or R.IsR1() then return end
    game.cast("self",3)
end
function R.Ready()
    return R.Slot.state == 0
end

function R.IsR1()
    return R.Slot.name == "ZedR"
end
function R.IsR2()
    return R.Slot.name == "ZedR2"
end
function R.Cost()
    return myHero.manaCost3
end
function R.Level()
    return player:spellslot(3).level
end
return R
