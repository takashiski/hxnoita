package noita;
import noita.Entity;
import noita.Files;

import haxe.extern.EitherType;

import lua.Table;


typedef ComponentId=Int;
typedef VariableName=String;

@:multiReturn extern class Transform
{
    var x:Int;
    var y:Int;
    var rotation:Int;
    var scale_x:Int;
    var scale_y:Int;
}

typedef Vector2={
    var x:EitherType<Int,Float>;
    var y:EitherType<Int,Float>;
}
@:native("_G")
extern class Noita
{
    public static function dofile(filepath:Files):Void;
    public static function dofile_once(filepath:Files):Void;
    public static function ActionUsed(inventoryitem_id:Int):Void;
    public static function ActionUsesRemainingChanged(inventoryitem_id:Int,uses_remaining:Int):Void;
    public static function GameHasFlagRun(flag:Flags):Bool;
    public static function GameAddFlagRun(flag:Flags):Void;
    public static function EntityGetTransform(entity_id:Entity):Transform;
    public static function EntityGetName(entity_id:Entity):String;
    public static function perk_spawn(x:Int,y:Int,perk_id:PerkList):Entity;
    public static function perk_pickup(entity_item:Entity,entity_who_picked:Entity,item_name:String,do_cosmetic_fx:Bool,kill_other_perks:Bool):Void;

    public static function EntityLoad( filename:String, ?pos_x:Int, ?pos_y:Int ):Entity;
    public static function EntityLoadCameraBound( filename:String, ?pos_x:Int, ?pos_y:Int ):Void;
    //(note: works only in dev builds)
    public static function EntitySave( entity_id:Entity, filename:String ):Void;
    public static function EntityCreateNew( ?name:String ):Entity;
    public static function EntityKill( entity_id:Entity ):Void;
    public static function EntityIsAlive( entity_id:Entity ):Bool;
    /*
    public static function EntityAddComponent( entity_id:Entity, component_type_name:String, ?table_of_component_values ):ComponentId;
    public static function EntityRemoveComponent( entity_id:Entity, component_id:ComponentId ):Void;


    public static function EntityGetAllComponents( entity_id:Entity ):Array<ComponentId>;
    public static function EntityGetComponent( entity_id:Entity, component_type_name ):Null<Array<ComponentId>>;
    public static function EntityGetFirstComponent( entity_id:Entity, component_type_name, ?tag:String):ComponentId;
    public static function EntitySetTransform( entity_id:Entity, x, ?y, ?rotation, ?scale_x, ?scale_y ):Void;
    public static function EntityGetTransform( entity_id:Entity ):Transform;
    public static function EntityAddChild( parent_id, child_id ):Void;
    public static function EntityGetAllChildren( entity_id:Entity ):Null<Array<Entity>>;
    public static function EntityGetParent( entity_id:Entity ):Entity;
    public static function EntityRemoveFromParent( entity_id:Entity ):Void;
    public static function EntitySetComponentsWithTagEnabled( entity_id:Entity, tag, enabled ):Void;
    public static function EntitySetComponentIsEnabled( entity_id:Entity, component_id:ComponentId, is_enabled ):Void;
    public static function EntityGetName( entity_id:Entity ):String;
    public static function EntitySetName( entity_id:Entity, name ):Void;
    // [string is comma separated];
    public static function EntityGetTags( entity_id:Entity ):Null<String>;
    public static function EntityGetWithTag( entity_tag:String):Entity;
    public static function EntityGetInRadius( pos_x:Int, pos_y:Int, radius ):Entity;
    public static function EntityGetInRadiusWithTag( pos_x:Int, pos_y:Int, radius, entity_tag:String):Entity;
    public static function EntityGetClosest( pos_x:Int, pos_y:Int ):Entity;
    public static function EntityGetClosestWithTag( pos_x:Int, pos_y:Int, tag:String ):Entity;
    public static function EntityGetWithName( name ):Entity;
    public static function EntityAddTag( entity_id:Entity, tag:String):Void;
    public static function EntityRemoveTag( entity_id:Entity, tag:String):Void;
    public static function EntityHasTag( entity_id:Entity, tag:String):Bool;
    public static function ComponentGetValue( component_id:ComponentId, variable_name:VariableName ):Null<String>;
    public static function ComponentGetValueBool( component_id:ComponentId, variable_name:VariableName ):Bool;
    public static function ComponentGetValueInt( component_id:ComponentId, variable_name:VariableName ):Int;
    public static function ComponentGetValueFloat( component_id:ComponentId, variable_name:VariableName ):Float;
    public static function ComponentGetValueVector2( component_id:ComponentId, variable_name:VariableName ):Vector2;
    public static function ComponentGetVectorSize( component_id:ComponentId, array_member_name, type_of_vector ):Int;
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
    public static function ComponentObjectGetMembers( component_id:ComponentId, object_name ) -> {string-string}|nil [returns a string-indexed table of string];
    public static function GetUpdatedEntityID():Entity;
    public static function GetUpdatedComponentID():ComponentId;
    public static function RegisterSpawnFunction( uint32 color, string function_name ):Void;
    public static function SpawnActionItem( x, y, level ):Void;
    public static function SpawnStash( x, y, level, action_count ):Entity;
    public static function SpawnApparition( x, y, level ):Int,entity_id;
    public static function LoadEntityToStash( entity_file, stash_id ):Void;
    public static function AddMaterialInventoryMaterial( entity_id:Entity, material_name, count ):Void;
    public static function GameScreenshake( strength, ?pos_x:Int, ?pos_y:Int ):Void;
    public static function GameOnCompleted():Void;
    public static function GameDoEnding2():Void;
    public static function GameIsIntroPlaying():Bool;
    public static function GameGetIsGamepadConnected():Bool;
    public static function GameGetWorldStateEntity():Entity;
    public static function GameGetPlayerStatsEntity():Entity;
    public static function GameGetOrbCountAllTime():Int;
    public static function GameGetOrbCountThisRun():Int;
    public static function GameGetOrbCollectedThisRun( int orb_id_zero_based ):Bool;
    public static function GameGetOrbCollectedAllTime( int orb_id_zero_based ):Bool;
    public static function CellFactory_GetName( int material_id ):String;
    public static function CellFactory_GetType( string material_name ):Int;
    public static function CellFactory_GetAllLiquids( include_statics = true ) -> {string};
    public static function CellFactory_GetAllSands( include_statics = true ) -> {string};
    public static function CellFactory_GetAllGases( include_statics = true ) -> {string};
    public static function CellFactory_GetAllFires( include_statics = true ) -> {string};
    public static function CellFactory_GetAllSolids( include_statics = true ) -> {string};
    public static function GameGetCameraPos():Vector2;
    public static function GameSetCameraPos( x, y ):Void;
    public static function GameSetCameraFree( is_free ):Void;
    public static function GameRegenItemAction( entity_id:Entity ):Void;
    public static function GameRegenItemActionsInContainer( entity_id:Entity ):Void;
    public static function GameRegenItemActionsInPlayer( entity_id:Entity ):Void;
    public static function GameKillInventoryItem( inventory_owner_entity_id, item_entity_id ):Void;
    public static function GameKillInventoryItem( who_picks_up_entity_id, item_entity_id ):Void;
    public static function GameDropAllItems( entity_id:Entity ):Void;
    public static function LoadPixelScene( string materials_filename:String, string colors_filename:String, x, y, string background_file, skip_biome_checks = false, skip_edge_textures = false, color_to_material_table = {} ):Void;
    public static function GameCreateParticle( string material_name, x, y, how_many, xvel, yvel, just_visual, ?draw_as_long ):Void;
    public static function GameShootProjectile( who_shot, x, y, target_x, target_y, projectile_entity, send_message ):Void;
    public static function GamePlayAnimation( entity_id:Entity, name, priority, [followup_name], [followup_priority] ):Void;
    public static function GameGetVelocityCompVelocity( entity_id:Entity ):Vector2;
    public static function GameGetGameEffect( entity_id:Entity, string GAME_EFFECT ):ComponentId;
    public static function GameGetGameEffectCount( entity_id:Entity, string GAME_EFFECT ) -> uint;
    public static function SetPlayerSpawnLocation( x, y ):Void;
    public static function UnlockItem( action_id ):Void;
    public static function GameGetPotionColor( entity_id:Entity ) -> uint;
    public static function Raytrace( x1, y1, x2, y2 ) -> did_hit,hit_x,hit_y;
    public static function FindFreePositionForBody( ideal_pos_x:Int, idea_pos_y:Int, velocity_x, velocity_y, body_radius ):Vector2;
    public static function GetSurfaceNormal( pos_x:Int, pos_y:Int, ray_length, ray_count ) -> found_normal,normal_x,normal_y,approximate_distance_from_surface;
    public static function GenomeSetHerdId( entity_id:Entity, string new_herd_id ):Void;
    public static function GamePrint( string log_line ):Void;
    public static function GamePrintImportant( string title, description ):Void;
    public static function DEBUG_GetMouseWorld():Vector2;
    public static function DEBUG_MARK( x, y, string message="", color_r=1, color_g=0, color_b=0 ):Void;
    public static function GameGetFrameNum():Int;
    public static function GameGetRealWorldTimeSinceStarted():Float;
    public static function IsPlayer( entity ):Bool;
    public static function GameIsDailyRun( entity ):Bool;
    public static function GlobalsSetValue( key, value ):Void;
    public static function GlobalsGetValue( key, default_value = "" ):Void;
    public static function MagicNumbersGetValue( key ):Void;
    public static function AutosaveDisable():Void;
    public static function StatsGetValue( key ):String;
    public static function StatsBiomeGetValue( key ):String;
    public static function StatsBiomeReset():Void;
    public static function StatsLogPlayerKill():Void;
    public static function CreateItemActionEntity( action_id, ?x, ?y ):Entity;
    public static function GetRandomActionWithType( x, y, max_level, type, i = 0):String;
    public static function BiomeMapSetSize( w, h )
    // [This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.];
    public static function BiomeMapGetSize() -> w,h
    // [This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.];
    public static function BiomeMapSetPixel( x, y, color_int )
     //[This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.];
    public static function BiomeMapGetPixel( x, y ) -> color_int
     //[This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.];
    public static function BiomeMapLoadImage( x, y, path ) 
    //[This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.];
    public static function BiomeMapLoadImageCropped( x, y, path, image_x, image_y, image_w, image_h ) 
    //[This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.];
    public static function BiomeMapGetVerticalPositionInsideBiome( x, y ):Float;
    public static function BiomeMapGetName( ?x, ?y ) -> name;
    public static function SetRandomSeed(x,y):Void;
    public static function Random( ?a, ?b ):Float|int.
     //[This is kinda messy. If given 0 arguments, returns number between 0 and 1. If given 1 arguments, returns int between 0 and 'a'. If given 2 arguments returns int between 'a' and 'b'.];
    public static function ProceduralRandom( x, y, (min,max) ):Int|number [See Random() documentation.];
    public static function RandomDistribution( min, max, mean, (sharpness=1.f), (baseline=0.005) ):Int;
    public static function RandomDistributionf( min, max, mean, (sharpness=1.f), (baseline=0.005) ):Float;
    public static function PhysicsAddBodyImage( entity_id:Entity, image_file, material = "", offset_x = 0, offset_y = 0, bool centered = false, bool is_circle = false, material_image_file = "" ):Int_body_id;
    public static function PhysicsAddBodyImage( entity_id:Entity, material, offset_x, offset_y, width, height, bool centered = false ):Int_body_id|nil;
    public static function PhysicsAddJoint( entity_id:Entity, body_id0, body_id1, offset_x, offset_y, string joint_type ):Int_joint_id;
    public static function PhysicsApplyForce( entity_id:Entity, float force_x, float force_y ):Void;
    public static function PhysicsApplyTorque( entity_id:Entity, float torque ):Void;
    public static function PhysicsApplyTorqueToComponent( entity_id:Entity, component_id:ComponentId, float torque ):Void;
    public static function PhysicsRemoveJoints( world_pos_min_x, world_pos_min_y, world_pos_max_x, world_pos_max_y  ):Void;
    public static function PhysicsSetStatic( entity_id:Entity, bool is_static ):Void;
    public static function PhysicsGetComponentVelocity( entity_id:Entity, component_id:ComponentId ) -> vel_x,vel_y;
    public static function PhysicsGetComponentAngularVelocity( entity_id:Entity, component_id:ComponentId ) -> vel;
    public static function PhysicsVecToGameVec( x, ?y ):Vector2;
    public static function GameVecToPhysicsVec( x, ?y ):Vector2;
    public static function LooseChunk( world_pos_x:Int, world_pos_y:Int, image_filename:String, ? max_durability ):Void;
    public static function LoadGameEffectEntityTo( entity_id:Entity, string game_effect_entity_file ) -> effect_entity_id;
    public static function GetGameEffectLoadTo( entity_id:Entity, string game_effect_entity_file, always_load_new ) -> effect_component_id;
    public static function AddFlagPersistent( key ):Bool_is_new;
    public static function RemoveFlagPersistent( key ):Void;
    public static function HasFlagPersistent( key ):Bool;
    public static function GameAddFlagRun( flag ):Void;
    public static function GameRemoveFlagRun( flag ):Void;
    public static function GameHasFlagRun( flag ):Bool;
    public static function GameTriggerMusicEvent( event_path, can_be_faded, x, y ):Void;
    public static function GameTriggerMusicCue( name ):Void;
    public static function GameTriggerMusicFadeOutAndDequeueAll( ?relative_fade_speed ):Void;
    public static function GamePlaySound( bank_filename:String, event_path, x, y ):Void;
    public static function GameEntityPlaySound( entity, event_name ):Void;
    public static function GameTextGetTranslatedOrNot( text_or_key ):String;
    public static function GameTextGet( key, ? param0, ? param1, ? param2 ):String;
    public static function GuiCreate() -> gui;
    public static function GuiDestroy( gui ):Void;
    public static function GuiStartFrame( gui ):Void;
    public static function GuiText( gui, x, y, text ):Void;
    public static function GuiTextCentered( gui, x, y, text ):Void;
    public static function GuiButton( gui, x, y, text, id ):Bool_clicked;
    public static function GuiLayoutBeginHorizontal( gui, x_rel, y_rel ):Void;
    public static function GuiLayoutBeginVertical( gui, x_rel, y_rel  ):Void;
    public static function GuiLayoutAddHorizontalSpacing( gui ):Void;
    public static function GuiLayoutAddVerticalSpacing( gui ):Void;
    public static function GuiLayoutEnd( gui ):Void;
    public static function DebugGetIsDevBuild():Bool;
    public static function DebugEnableTrailerMode():Void;
    public static function GameGetIsTrailerModeEnabled():Bool;
    // [This doesn't do anything at the moment.];
    public static function Debug_SaveTestPlayer():Void;;
    public static function EntityConvertToMaterial( entity_id:Entity, string material ):Void;
    public static function ConvertEverythingToGold():Void;
    public static function ModLuaFileAppend( to_filename:String, from_filename:String ):Void;
    public static function ModMagicNumbersFileAdd( filename:String ):Void;
    public static function ModMaterialsFileAdd( filename:String ):Void;
    public static function ModRegisterAudioEventMappings( filename:String ):Void;
    public static function ModDevGenerateSpriteUVsForDirectory( directory_path ) [Only available via noita_dev.exe];
    public static function RegisterProjectile( entity_filename:String ):Void;
    public static function RegisterGunAction():Void;
    public static function RegisterGunShotEffects():Void;
    public static function BeginProjectile( entity_filename:String ):Void;
    public static function EndProjectile():Void;
    public static function BeginTriggerTimer( timeout_frames ):Void;
    public static function BeginTriggerHitWorld():Void;
    public static function BeginTriggerDeath():Void;
    public static function EndTrigger():Void;
    public static function SetProjectileConfigs():Void;
    public static function StartReload( reload_time ):Void;
    public static function ActionUsesRemainingChanged( inventoryitem_id, uses_remaining ):Void;
    public static function ActionUsed( inventoryitem_id ):Void;
    public static function LogAction( action_name ):Void;
    public static function OnActionPlayed( action_id ):Void;
    public static function BaabInstruction( name ):Void;
    public static function OnNotEnoughManaForAction():Void;
    public static function SetValueInt( key, value ):Void;
    public static function GetValueInt( key, default_value ):Void;
    public static function SetValueNumber( key, value ):Void;
    public static function GetValueNumber( key, default_value ):Void;
    public static function SetValueBool( key, value ):Void;
    public static function GetValueBool( key, default_value ):Void;
    */
}