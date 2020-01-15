import lua.Lua;
import lua.Table;
import noita.Files;
import noita.Noita;
import noita.Flags;
import noita.Entity;
import noita.PerkList;
import noita.EventFunctions;
import noita.wand.Spells;
import noita.Types;


@:expose
class Main
{
    public static function OnPlayerSpawned(player_entity:EntityId):Void
    {
        if(hasAlreadyRun("mod_test"))return;
        var transform = Noita.EntityGetTransform(player_entity);
        var perks = new Array<PerkList>();
        perks.push(PerkList.GLASS_CANNON);
        perks.push(PerkList.CRITICAL_HIT);
        perks.push(PerkList.EXTRA_MONEY);
        perks.push(PerkList.EXTRA_HP);
        perks.push(PerkList.ATTRACT_ITEMS);
        perks.push(PerkList.HEARTS_MORE_EXTRA_HP);
        perks.push(PerkList.REMOVE_FOG_OF_WAR);
        perks.push(PerkList.EDIT_WANDS_EVERYWHERE);
        perks.push(PerkList.RESPAWN);
        perks.push(PerkList.PROJECTILE_HOMING);
        perks.push(PerkList.SAVING_GRACE);

        for(perk in perks)
        {
            var perk_entity = Noita.perk_spawn(transform.x,transform.y,perk);
            Noita.perk_pickup(perk_entity,player_entity,Noita.EntityGetName(perk_entity),false,false);
        }


        Noita.GamePrintImportant( "You got power!!!","by Mod" );
    }
    static function hasAlreadyRun(modName:String):Bool
    {
        if(Noita.GameHasFlagRun(modName))return true;
        Noita.GameHasFlagRun(modName);
        return false;
    }
    /*
    public static function OnModPreInit()
    {
    }

    public static function OnModInit(){}

    public static function OnModPostInit(){}

    public static function OnWorldInitialized(){}

    public static function OnWorldPreUpdate() {}

    public static function OnWorldPostUpdate(){}
*/
    public static function main()
    {
        Noita.dofile(Files.perk);
        Lua.rawset(untyped __lua__("_G"),EventFunctionsName.OnPlayerSpawned,Main.OnPlayerSpawned);
    }
}

