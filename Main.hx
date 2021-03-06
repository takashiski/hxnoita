import lua.Lua;
import lua.Table;
import noita.Files;
import noita.Noita;
import noita.Flags;
import noita.Entity;
import noita.PerkList;
import noita.EventFunctions;
import noita.wand.Spells;
import noita.gun.procedural.GunActionUtils;




@:expose
class Main
{
    public static function OnPlayerSpawned(playerEntity:EntityId):Void
    {
        if(hasAlreadyRun("mod_test"))return;


        //Set Perks
    var transform = Entity.GetTransform(playerEntity);
    var perkList=[
        PerkList.PROJECTILE_HOMING,
        PerkList.RESPAWN,
        PerkList.EXTRA_HP,
        PerkList.EXTRA_MONEY,
        PerkList.EDIT_WANDS_EVERYWHERE,
        PerkList.REMOVE_FOG_OF_WAR,
        PerkList.SAVING_GRACE,
        PerkList.HEARTS_MORE_EXTRA_HP
    ];
    for(perk in perkList)
    {
        var perkEntity=Noita.perk_spawn(transform.x,transform.y,perk);
        Noita.perk_pickup(perkEntity,playerEntity,Entity.GetName(perkEntity),false,false);
        Noita.GamePrint(Entity.GetName(perkEntity));
    }


        Noita.GamePrint("init perks");
        var inventory=null;
        var cape=null;
        var playerArm=null;
        var playerChildEntities=Entity.GetAllChildren(playerEntity);
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
            /*
            if(inventoryItems!=null)
            {
                Table.foreach(inventoryItems,(i,item)->
                {
                    Noita.GameKillInventoryItem(playerEntity,item);
                    Noita.GamePrint("remove");
                });
            }
            */ 
            final wand1=Entity.Load("data/entities/items/wands/wand_good/wand_good_1.xml");
//            GunActionUtils.AddGunActionPermanent(wand1,Spells.MATTER_EATER);
            GunActionUtils.AddGunActionPermanent(wand1,Spells.SPIRAL_SHOT);
            Entity.AddChild(inventory,wand1);
            //Noita.GamePrint("got wand1");
            final wand2=Entity.Load("data/entities/items/wands/wand_good/wand_good_2.xml");
            Entity.AddChild(inventory,wand2);
            //Noita.GamePrint("got wand2");
            final wand3=Entity.Load("data/entities/items/wands/wand_good/wand_good_3.xml");
            Entity.AddChild(inventory,wand3);
            //Noita.GamePrint("got wand3");
            final item_entity1 = Entity.Load("data/entities/items/pickup/potion_water.xml");
            Entity.AddChild(inventory,item_entity1);
            //Noita.GamePrint("got water");
            final item_entity2 = Entity.Load("data/entities/items/pickup/potion_water.xml");
            Entity.AddChild(inventory,item_entity2);
            //Noita.GamePrint("got water");
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
        Noita.dofile(Files.gunActionUtils);

        Lua.rawset(untyped __lua__("_G"),EventFunctionsName.OnPlayerSpawned,Main.OnPlayerSpawned);
  }
}
