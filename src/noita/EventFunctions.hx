package noita;
import noita.Entity;

enum abstract EventFunctionsName(String)from String to String
{
    var OnPlayerSpawned;
}

interface EventFunctions
{
    function OnPlayerSpawned(player_entity:Entity):Void;
    function OnModPreInit():Void;
    function OnModInit():Void;
    function OnModPostInit():Void;
    function OnWorldInitialized():Void;
    function OnWorldPreUpdate():Void;
    function OnWorldPostUpdate():Void;
}