package noita;

//dofile( "data/scripts/perks/perk.lua" )


@:enum abstract Perks(String) from String to String
{

        var extraMoney="EXTRA_MONEY";
        var extraHp="EXTRA_HP";
        var vampirism="VAMPIRISM";
        var heartsMoreExtraHp="HEARTS_MORE_EXTRA_HP";
        var respawn="RESPAWN";
        var removeFogOfWar="REMOVE_FOG_OF_WAR";
        var editWandsEverywhare="EDIT_WANDS_EVERYWHERE";
        var projectileHoming="PROJECTILE_HOMING";
        var projectileHomingShooter="PROJECTILE_HOMING_SHOOTER";
        var bounce = "BOUNCE";

}