package noita;
import lua.Table;
import noita.Types;

typedef ComponentId=Int;

@:native("_G")
extern class Component
{
    public static function GetValue( component_id:ComponentId, variable_name:VariableName ):Null<String>;
    public static function GetValueBool( component_id:ComponentId, variable_name:VariableName ):Bool;
    public static function GetValueInt( component_id:ComponentId, variable_name:VariableName ):Int;
    public static function GetValueFloat( component_id:ComponentId, variable_name:VariableName ):Float;
    public static function GetValueVector2( component_id:ComponentId, variable_name:VariableName ):Vector2;
    public static function GetVectorSize( component_id:ComponentId, array_member_name:String, type_of_vector:Dynamic ):Int;
    // -> multiple return types|nil;
    public static function GetVectorValue( component_id:ComponentId, array_name:String, type:Any, i:Int ):Null<Any>;
    // -> {multiple types}|nil;
    public static function GetVector( component_id:ComponentId, array_name:String, type:Any ):Null<Table<Dynamic,Any>>;
    public static function SetValue( component_id:ComponentId, variable_name:VariableName, value:Dynamic ):Void;
    public static function SetValueVector2( component_id:ComponentId, variable_name:VariableName, x:Int, y:Int ):Void;
    public static function SetValueValueRange( component_id:ComponentId, variable_name:VariableName, min:Int, max:Int ):Void;
    public static function SetValueValueRangeInt( component_id:ComponentId, variable_name:VariableName, min:Int, max:Int ):Void;
    public static function SetMetaCustom( component_id:ComponentId, variable_name:VariableName, value:String ):Void;
    public static function GetMetaCustom( component_id:ComponentId, variable_name:VariableName ):Null<String>;
    //[returns a string-indexed table of string];
    public static function GetMembers( component_id:ComponentId ):Table<String,String>; 
    public static function ObjectGetValue( component_id:ComponentId, object_name:String, variable_name:VariableName ):Null<String>;
    public static function ObjectGetValueBool( component_id:ComponentId, object_name:String, variable_name:VariableName ):Null<String>;
    public static function ObjectSetValue( component_id:ComponentId, object_name:String, variable_name:VariableName, value:String ):Void;
  public static function ObjectGetMembers( component_id:ComponentId, object_name:String ):Table<String,String>;
}