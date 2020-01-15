
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
        Noita.GamePrint("init perks");
        var inventory=null;
        var cape=null;
        var playerArm=null;
        var playerChildEntities=Entity.GetAllChildren(player_entity);
        if(playerChildEntities!=null)
        {
            Table.foreach(playerChildEntities,(i,childEntity)->
            {
                final childEntityName=Entity.GetName(childEntity);
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
            final inventoryItems=Entity.GetAllChildren(inventory);
            if(inventoryItems!=null)
            {
                Table.foreach(inventoryItems,(i,item)->
                {
                    Noita.GameKillInventoryItem(player_entity,item);
                    Noita.GamePrint("remove");
                });
            } 
            final wand1=Entity.Load("data/entities/items/wands/wand_good/wand_good_1.xml");
            Entity.AddChild(inventory,wand1);
            Noita.GamePrint("got wand1");
            final wand2=Entity.Load("data/entities/items/wands/wand_good/wand_good_2.xml");
            Entity.AddChild(inventory,wand2);
            Noita.GamePrint("got wand2");
            final wand3=Entity.Load("data/entities/items/wands/wand_good/wand_good_3.xml");
            Entity.AddChild(inventory,wand3);
            Noita.GamePrint("got wand3");
            final item_entity1 = Entity.Load("data/entities/items/pickup/potion_water.xml");
            Entity.AddChild(inventory,item_entity1);
            Noita.GamePrint("got water");
            final item_entity2 = Entity.Load("data/entities/items/pickup/potion_water.xml");
            Entity.AddChild(inventory,item_entity2);
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

