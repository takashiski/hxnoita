package noita;

import lua.Table;
import noita.Component;
import noita.Types;



@:native("_G")

extern class Entity
{
    @:native("EntityLoad")
    public static function Load( filename:String, ?pos_x:Int, ?pos_y:Int ):EntityId;
    @:native("EntityLoadCameraBound")
    public static function LoadCameraBound( filename:String, ?pos_x:Int, ?pos_y:Int ):Void;
    //(note: works only in dev builds)
    @:native("EntitySave")
    public static function Save( entity_id:EntityId, filename:String ):Void;
    @:native("EntityCreateNew")
    public static function CreateNew( ?name:String ):EntityId;
    @:native("EntityKill")
    public static function Kill( entity_id:EntityId ):Void;
    @:native("EntityIsAlive")
    public static function IsAlive( entity_id:EntityId ):Bool;
    @:native("EntityAddComponent")
    public static function AddComponent( entity_id:EntityId, component_type_name:String, ?table_of_component_values:Table<Dynamic,Dynamic> ):ComponentId;
    @:native("EntityRemoveComponent")
    public static function RemoveComponent( entity_id:EntityId, component_id:ComponentId ):Void;
    @:native("EntityGetAllComponents")
    public static function GetAllComponents( entity_id:EntityId ):Array<ComponentId>;
    @:native("EntityGetComponent")
    public static function GetComponent( entity_id:EntityId, component_type_name:Dynamic ):Table<Int,EntityId>;
    @:native("EntityGetFirstComponent")
    public static function GetFirstComponent( entity_id:EntityId, component_type_name:Dynamic, ?tag:String):ComponentId;
    @:native("EntitySetTransform")
    public static function SetTransform( entity_id:EntityId, x:Int, ?y:Int, ?rotation:Int, ?scale_x:Int, ?scale_y:Int ):Void;
    @:native("EntityGetTransform")
    public static function GetTransform( entity_id:EntityId ):Transform;
    @:native("EntityAddChild")
    public static function AddChild( parent_id:EntityId, child_id:EntityId ):Void;
    @:native("EntityGetAllChildren")
    public static function GetAllChildren(entity_id:EntityId):Table<Int,EntityId>;
    @:native("EntityGetParent")
    public static function GetParent( entity_id:EntityId ):EntityId;
    @:native("EntityRemoveFromParent")
    public static function RemoveFromParent( entity_id:EntityId ):Void;
    @:native("EntitySetComponentsWithTagEnabled")
    public static function SetComponentsWithTagEnabled( entity_id:EntityId, tag:String, enabled:Bool ):Void;
    @:native("EntitySetComponentIsEnabled")
    public static function SetComponentIsEnabled( entity_id:EntityId, component_id:ComponentId, is_enabled:Bool ):Void;
    @:native("EntityGetName")
    public static function GetName( entity_id:EntityId ):String;
    @:native("EntitySetName")
    public static function SetName( entity_id:EntityId, name:String ):Void;
    // [string is comma separated];
    @:native("EntityGetTags")
    public static function GetTags( entity_id:EntityId ):Null<String>;
    @:native("EntityGetWithTag")
    public static function GetWithTag( entity_tag:String):EntityId;
    @:native("EntityGetInRadius")
    public static function GetInRadius( pos_x:Int, pos_y:Int, radius:Int ):EntityId;
    @:native("EntityGetInRadiusWithTag")
    public static function GetInRadiusWithTag( pos_x:Int, pos_y:Int, radius:Int, entity_tag:String):EntityId;
    @:native("EntityGetClosest")
    public static function GetClosest( pos_x:Int, pos_y:Int ):EntityId;
    @:native("EntityGetClosestWithTag")
    public static function GetClosestWithTag( pos_x:Int, pos_y:Int, tag:String ):EntityId;
    @:native("EntityGetWithName")
    public static function GetWithName( name:String ):EntityId;
    @:native("EntityAddTag")
    public static function AddTag( entity_id:EntityId, tag:String):Void;
    @:native("EntityRemoveTag")
    public static function RemoveTag( entity_id:EntityId, tag:String):Void;
    @:native("EntityHasTag")
    public static function HasTag( entity_id:EntityId, tag:String):Bool;
}