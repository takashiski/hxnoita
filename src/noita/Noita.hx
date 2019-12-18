package noita;
import noita.Flags;
import noita.Entity;





@:multiReturn extern class Transform
{
    var x:Int;
    var y:Int;
    var rotation:Int;
    var scale_x:Int;
    var scale_y:Int;
}
@:native("_G")

extern class Noita
{
    public static function ActionUsed(inventoryitem_id:Int):Void;
    public static function ActionUsesRemainingChanged(inventoryitem_id:Int,uses_remaining:Int):Void;
    public static function GameHasFlagRun(flag:Flags):Bool;
    public static function GameAddFlagRun(flag:Flags):Void;
    public static function EntityGetTransform(entity_id:Entity):Transform;
    public static function EntityGetName(entity_id:Entity):String;
    public static function perk_spawn(x:Int,y:Int,perk_id:String):Entity;
    public static function perk_pickup(entity_item:Entity,entity_who_picked:Entity,item_name:String,do_cosmetic_fx:Bool,kill_other_perks:Bool):Void;
}