return {
    ---@param cutscene WorldCutscene
    welcome = function(cutscene, event)
        local inuslot = Game.world:getEvent("inuslot_xboxorig")
        cutscene:showNametag("The House")
        cutscene:text("* ", "default", "the_house")
        cutscene:text("* You CHEATER", "wtf", "the_house")
        cutscene:hideNametag()
    end,
    starw = function(cutscene,event)
        local is_dpr = (Kristal.Mods.data.dpr_main ~= nil)
        if is_dpr then
            local choice = cutscene:textChoicer(
                "* Is this [color:yellow]WORLD[color:reset]   [wait:30]   [color:yellow]Pissing[color:reset] you off?",
                {"Yes", "    No"}
            )
            if choice == 1 then
                Assets.playSound("kristal_intro")
                Game.fader:fadeOut(function ()
                    Game:swapIntoMod("dpr_main", false, "main_hub")
                end, {
                    color = COLORS.white,
                    speed = 2
                })
                cutscene:text("* [noskip][speed:0.4]I'm the original   [color:yellow]Starwalker[color:reset]")
            else
                cutscene:text("* I'm the original   [color:yellow]Starwalker[color:reset]")
            end
        else
            cutscene:text("* These [color:yellow]stairs[color:reset] are [color:yellow]Pissing[color:reset] me\noff...")
            cutscene:text("* I'm the original   [color:yellow]Starwalker[color:reset]")
        end
    end
}
