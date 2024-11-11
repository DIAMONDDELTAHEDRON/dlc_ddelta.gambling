return function(cutscene, event)
    cutscene:text("* It's the return bin.")
    cutscene:text("* Would you like to leave this Place?")

    if cutscene:choicer({"Sure", "Nope"}) == 2 then
        return
    end
    cutscene:after(function()
        Game:swapIntoMod("dpr_main", false, "main_hub")
    end)
    cutscene:wait(0.2)
    Game.world.music:fade(0, 80/30)
    cutscene:wait(cutscene:fadeOut(0, {color = {0, 0, 0}}))
    for i = 0,5 do
        cutscene:playSound("impact", (1 - (i/10)) ^ (4) )
        cutscene:wait(0.2)
    end
    cutscene:wait(1/4)
end