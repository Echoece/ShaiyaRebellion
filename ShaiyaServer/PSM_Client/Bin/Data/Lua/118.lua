-- //////////////////////////////////////////////////// ///////////////////////
-- Caelem Sacra Boss 1st Boss Monster_ID--2469 AI 118.Lua ver.090513
-- //////////////////////////////////////////////////// ///////////////////////



-- //////////////////////////////////////////////////// ///////////////////////

Mob = LuaMob (CMob)

-- //////////////////////////////////////////////////// //////////////////
-- User variables are declared here.


-- //////////////////////////////////////////////////// //////////////////
-- User functions are declared here.



-- //////////////////////////////////////////////////////////////////
function Init()

end

-- //////////////////////////////////////////////////////////////////
function OnAttacked( dwTime, dwCharID )

end

-- //////////////////////////////////////////////////////////////////
function OnAttackable( dwTime, dwCharID )

end

-- //////////////////////////////////////////////////////////////////
function OnNormalReset( dwTime )


end

-- //////////////////////////////////////////////////////////////////
function OnDeath( dwTime, dwAttackedCount )

		Mob:LuaCreateMob( 2470,1,0.0,0.0 )
end

-- //////////////////////////////////////////////////////////////////
function OnReturnHome( dwTime, dwAttackedCount )

end

-- //////////////////////////////////////////////////////////////////
function OnMoveEnd( dwTime )

end


-- //////////////////////////////////////////////////////////////////
function WhileCombat( dwTime, dwHPPercent, dwAttackedCount )

end