package noita;
import noita.Types;

typedef ComponentId=Int;

@:native("_G")
extern class Component
{
    public static function ComponentGetValue( component_id:ComponentId, variable_name:VariableName ):Null<String>;
    public static function ComponentGetValueBool( component_id:ComponentId, variable_name:VariableName ):Bool;
    public static function ComponentGetValueInt( component_id:ComponentId, variable_name:VariableName ):Int;
    public static function ComponentGetValueFloat( component_id:ComponentId, variable_name:VariableName ):Float;
    public static function ComponentGetValueVector2( component_id:ComponentId, variable_name:VariableName ):Vector2;
    public static function ComponentGetVectorSize( component_id:ComponentId, array_member_name:String, type_of_vector:Dynamic ):Int;
    public static function ComponentGetVectorValue( component_id:ComponentId, array_name, type, i ) -> multiple return types|nil;
    public static function ComponentGetVector( component_id:ComponentId, array_name, type ) -> {multiple types}|nil;
    public static function ComponentSetValue( component_id:ComponentId, variable_name:VariableName, value ):Void;
    public static function ComponentSetValueVector2( component_id:ComponentId, variable_name:VariableName, x, y ):Void;
    public static function ComponentSetValueValueRange( component_id:ComponentId, variable_name:VariableName, min, max ):Void;
    public static function ComponentSetValueValueRangeInt( component_id:ComponentId, variable_name:VariableName, min, max ):Void;
    public static function ComponentSetMetaCustom( component_id:ComponentId, variable_name:VariableName, value ):Void;
    public static function ComponentGetMetaCustom( component_id:ComponentId, variable_name:VariableName ):Null<String>;
    public static function ComponentGetMembers( component_id:ComponentId ) -> {string-string} [returns a string-indexed table of string];
    public static function ComponentObjectGetValue( component_id:ComponentId, object_name, variable_name:VariableName ):Null<String>;
    public static function ComponentObjectGetValueBool( component_id:ComponentId, object_name, variable_name:VariableName ):Null<String>;
    public static function ComponentObjectGetValue( component_id:ComponentId, object_name, variable_name:VariableName ):Null<String>;
    public static function ComponentObjectGetValue( component_id:ComponentId, object_name, variable_name:VariableName ):Null<String>;
    public static function ComponentObjectSetValue( component_id:ComponentId, object_name, variable_name:VariableName, value ):Void;
    public static function ComponentObjectGetMembers( component_id:ComponentId, object_name ) -> {string-string}
}