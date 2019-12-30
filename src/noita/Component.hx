package noita;
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
    public static function GetVectorValue( component_id:ComponentId, array_name, type, i ) -> multiple return types|nil;
    public static function GetVector( component_id:ComponentId, array_name, type ) -> {multiple types}|nil;
    public static function SetValue( component_id:ComponentId, variable_name:VariableName, value ):Void;
    public static function SetValueVector2( component_id:ComponentId, variable_name:VariableName, x, y ):Void;
    public static function SetValueValueRange( component_id:ComponentId, variable_name:VariableName, min, max ):Void;
    public static function SetValueValueRangeInt( component_id:ComponentId, variable_name:VariableName, min, max ):Void;
    public static function SetMetaCustom( component_id:ComponentId, variable_name:VariableName, value ):Void;
    public static function GetMetaCustom( component_id:ComponentId, variable_name:VariableName ):Null<String>;
    public static function GetMembers( component_id:ComponentId ) -> {string-string} [returns a string-indexed table of string];
    public static function ObjectGetValue( component_id:ComponentId, object_name, variable_name:VariableName ):Null<String>;
    public static function ObjectGetValueBool( component_id:ComponentId, object_name, variable_name:VariableName ):Null<String>;
    public static function ObjectGetValue( component_id:ComponentId, object_name, variable_name:VariableName ):Null<String>;
    public static function ObjectGetValue( component_id:ComponentId, object_name, variable_name:VariableName ):Null<String>;
    public static function ObjectSetValue( component_id:ComponentId, object_name, variable_name:VariableName, value ):Void;
    public static function ObjectGetMembers( component_id:ComponentId, object_name ) -> {string-string}
}