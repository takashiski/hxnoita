import lua.Lua;
import lua.Table;
import noita.Files;
import noita.Noita;
import noita.Flags;
import noita.Entity;
import noita.PerkList;
import noita.EventFunctions;
import noita.wand.Spells;


@:expose
class Main
{
    public static function OnPlayerSpawned(player_entity:Entity):Void
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

        for(perk in perks)
        {
            var perk_entity = Noita.perk_spawn(transform.x,transform.y,perk);
            Noita.perk_pickup(perk_entity,player_entity,Noita.EntityGetName(perk_entity),false,false);
        }

        Noita.GamePrint("init perks");
        var inventory=null;
        var cape=null;
        var playerArm=null;
        var playerChildEntities=Noita.EntityGetAllChildren(player_entity);
        if(playerChildEntities!=null)
        {
            Table.foreach(playerChildEntities,(i,childEntity)->
            {
                final childEntityName=Noita.EntityGetName(childEntity);
 //               untyped __lua__("GamePrint(childEntity)");
                if(childEntityName=="inventory_quick")
                {
                    inventory=childEntity;
                    untyped __lua__("GamePrint(childEntity)");
                }
                if(childEntityName=="cape")
                {
                    cape=childEntity;
                }
                if(childEntityName=="arm_r")
                {
                    playerArm=childEntity;
                }
            });
        }
        else 
        {
            Noita.GamePrint("player has no child");
        }
        if(inventory!=null)
        {
            final inventoryItems=Noita.EntityGetAllChildren(inventory);
            if(inventoryItems!=null)
            {
                Table.foreach(inventoryItems,(i,item)->
                {
                    Noita.GameKillInventoryItem(player_entity,item);
                    Noita.GamePrint("remove");
                });
            } 
            final wand1=Noita.EntityLoad("data/entities/items/wands/wand_good/wand_good_1.xml");
            Noita.EntityAddChild(inventory,wand1);
            Noita.GamePrint("got wand1");
            final wand2=Noita.EntityLoad("data/entities/items/wands/wand_good/wand_good_2.xml");
            Noita.EntityAddChild(inventory,wand2);
            Noita.GamePrint("got wand2");
            final wand3=Noita.EntityLoad("data/entities/items/wands/wand_good/wand_good_3.xml");
            Noita.EntityAddChild(inventory,wand3);
            Noita.GamePrint("got wand3");
            final item_entity1 = Noita.EntityLoad("data/entities/items/pickup/potion_water.xml");
            Noita.EntityAddChild(inventory,item_entity1);
            Noita.GamePrint("got water");
            final item_entity2 = Noita.EntityLoad("data/entities/items/pickup/potion_water.xml");
            Noita.EntityAddChild(inventory,item_entity2);
            Noita.GamePrint("got water");
        }			
        else 
        {
            Noita.GamePrint("inventory is empty");
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
