package noita;
import noita.Entity;
import noita.Files;
import noita.Component;
import noita.Types;

import lua.Table;





@:native("_G")
extern class Noita
{
    public static function dofile(filepath:Files):Void;
    public static function dofile_once(filepath:Files):Void;
    public static function ActionUsed(inventoryitem_id:Int):Void;
    public static function ActionUsesRemainingChanged(inventoryitem_id:Int,uses_remaining:Int):Void;
    public static function GameHasFlagRun(flag:Flags):Bool;
    public static function GameAddFlagRun(flag:Flags):Void;
    public static function perk_spawn(x:Int,y:Int,perk_id:PerkList):EntityId;
    public static function perk_pickup(entity_item:EntityId,entity_who_picked:EntityId,item_name:String,do_cosmetic_fx:Bool,kill_other_perks:Bool):Void;
    //public static function GameKillInventoryItem( who_picks_up_entity_id:EntityId, item_entity_id:EntityId ):Void;
    public static function GameKillInventoryItem( inventory_owner_entity_id:EntityId, item_entity_id:EntityId ):Void;
    public static function GamePrint( log_line:String ):Void;
    public static function GamePrintImportant( title:String, description:String ):Void;
    //必要だから抜き出した
    //public static function GetUpdatedEntityID():EntityId;
    //public static function GetUpdatedComponentID():ComponentId;
   // public static function AddMaterialInventoryMaterial( entity_id:EntityId, material_name:String, count:Int ):Void;




    public static function EntityLoad( filename:String, ?pos_x:Int, ?pos_y:Int ):EntityId;
    public static function EntityLoadCameraBound( filename:String, ?pos_x:Int, ?pos_y:Int ):Void;
    //(note: works only in dev builds)
    public static function EntitySave( entity_id:EntityId, filename:String ):Void;
    public static function EntityCreateNew( ?name:String ):EntityId;
    public static function EntityKill( entity_id:EntityId ):Void;
    public static function EntityIsAlive( entity_id:EntityId ):Bool;


    public static function EntityAddComponent( entity_id:EntityId, component_type_name:String, ?table_of_component_values:Table<Dynamic,Dynamic> ):ComponentId;
    public static function EntityRemoveComponent( entity_id:EntityId, component_id:ComponentId ):Void;

    public static function EntityGetAllComponents( entity_id:EntityId ):Array<ComponentId>;
    public static function EntityGetComponent( entity_id:EntityId, component_type_name:Dynamic ):Null<Table<Int,EntityId>>;
    public static function EntityGetFirstComponent( entity_id:EntityId, component_type_name:Dynamic, ?tag:String):ComponentId;
    public static function EntitySetTransform( entity_id:EntityId, x:Int, ?y:Int, ?rotation:Int, ?scale_x:Int, ?scale_y:Int ):Void;
    public static function EntityGetTransform( entity_id:EntityId ):Transform;
    public static function EntityAddChild( parent_id:EntityId, child_id:EntityId ):Void;
    public static function EntityGetAllChildren( entity_id:EntityId ):Null<Array<Entity>>;
    public static function EntityGetParent( entity_id:EntityId ):EntityId;
    public static function EntityRemoveFromParent( entity_id:EntityId ):Void;
    public static function EntitySetComponentsWithTagEnabled( entity_id:EntityId, tag:String, enabled:Bool ):Void;
    public static function EntitySetComponentIsEnabled( entity_id:EntityId, component_id:ComponentId, is_enabled:Bool ):Void;
    public static function EntityGetName( entity_id:EntityId ):String;
    public static function EntitySetName( entity_id:EntityId, name:String ):Void;
    // [string is comma separated];
    public static function EntityGetTags( entity_id:EntityId ):Null<String>;
    public static function EntityGetWithTag( entity_tag:String):EntityId;
    public static function EntityGetInRadius( pos_x:Int, pos_y:Int, radius:Int ):EntityId;
    public static function EntityGetInRadiusWithTag( pos_x:Int, pos_y:Int, radius:Int, entity_tag:String):EntityId;
    public static function EntityGetClosest( pos_x:Int, pos_y:Int ):EntityId;
    public static function EntityGetClosestWithTag( pos_x:Int, pos_y:Int, tag:String ):EntityId;
    public static function EntityGetWithName( name:String ):EntityId;
    public static function EntityAddTag( entity_id:EntityId, tag:String):Void;
    public static function EntityRemoveTag( entity_id:EntityId, tag:String):Void;
    public static function EntityHasTag( entity_id:EntityId, tag:String):Bool;
    public static function ComponentGetValue( component_id:ComponentId, variable_name:VariableName ):Null<String>;
    public static function ComponentGetValueBool( component_id:ComponentId, variable_name:VariableName ):Bool;
    public static function ComponentGetValueInt( component_id:ComponentId, variable_name:VariableName ):Int;
    public static function ComponentGetValueFloat( component_id:ComponentId, variable_name:VariableName ):Float;
    public static function ComponentGetValueVector2( component_id:ComponentId, variable_name:VariableName ):Vector2;
    public static function ComponentGetVectorSize( component_id:ComponentId, array_member_name:String, type_of_vector:Dynamic ):Int;
    public static function ComponentGetVectorValue( component_id:ComponentId, array_name:String, type:Any, i:Int ):Null<Table<Int,Any>>;
    public static function ComponentGetVector( component_id:ComponentId, array_name:String, type:Any ):Null<Any>;
    public static function ComponentSetValue( component_id:ComponentId, variable_name:VariableName, value:Dynamic ):Void;
    public static function ComponentSetValueVector2( component_id:ComponentId, variable_name:VariableName, x:Int, y:Int ):Void;
    public static function ComponentSetValueValueRange( component_id:ComponentId, variable_name:VariableName, min:Int, max:Int ):Void;
    public static function ComponentSetValueValueRangeInt( component_id:ComponentId, variable_name:VariableName, min:Int, max:Int ):Void;
    public static function ComponentSetMetaCustom( component_id:ComponentId, variable_name:VariableName, value:Int ):Void;
    public static function ComponentGetMetaCustom( component_id:ComponentId, variable_name:VariableName ):Null<String>;
    public static function ComponentGetMembers( component_id:ComponentId ):Table<String,String>;
    public static function ComponentObjectGetValue( component_id:ComponentId, object_name:String, variable_name:VariableName ):Null<String>;
    public static function ComponentObjectGetValueBool( component_id:ComponentId, object_name:String, variable_name:VariableName ):Null<String>;
    public static function ComponentObjectSetValue( component_id:ComponentId, object_name:String, variable_name:VariableName, value:Dynamic ):Void;
    public static function ComponentObjectGetMembers( component_id:ComponentId, object_name:String ):Table<String,String>;
    // -> {string-string}|nil [returns a string-indexed table of string];
    public static function GetUpdatedEntityID():EntityId;
    public static function GetUpdatedComponentID():ComponentId;
    public static function RegisterSpawnFunction(color:Int, function_name:String ):Void;
    public static function SpawnActionItem( x:Int, y:Int, level:Dynamic ):Void;
    public static function SpawnStash( x:Int, y:Int, level:Dynamic, action_count:Int ):EntityId;
    public static function SpawnApparition( x:Int, y:Int, level:Dynamic ):Apparition;
    public static function LoadEntityToStash( entity_file:Dynamic, stash_id:String ):Void;
    public static function AddMaterialInventoryMaterial( entity_id:EntityId, material_name:String, count:Int ):Void;
    public static function GameScreenshake( strength:Int, ?pos_x:Int, ?pos_y:Int ):Void;
    public static function GameOnCompleted():Void;
    public static function GameDoEnding2():Void;
    public static function GameIsIntroPlaying():Bool;
    public static function GameGetIsGamepadConnected():Bool;
    public static function GameGetWorldStateEntity():EntityId;
    public static function GameGetPlayerStatsEntity():EntityId;
    public static function GameGetOrbCountAllTime():Int;
    public static function GameGetOrbCountThisRun():Int;
    public static function GameGetOrbCollectedThisRun( orb_id_zero_based:Int ):Bool;
    public static function GameGetOrbCollectedAllTime( orb_id_zero_based:Int ):Bool;
    /*
    public static function CellFactory_GetName( int material_id ):String;
    public static function CellFactory_GetType( string material_name ):Int;
    public static function CellFactory_GetAllLiquids( include_statics = true ) -> {string};
    public static function CellFactory_GetAllSands( include_statics = true ) -> {string};
    public static function CellFactory_GetAllGases( include_statics = true ) -> {string};
    public static function CellFactory_GetAllFires( include_statics = true ) -> {string};
    public static function CellFactory_GetAllSolids( include_statics = true ) -> {string};
    public static function GameGetCameraPos():Vector2;
    public static function GameSetCameraPos( x:Int, y ):Void;
    public static function GameSetCameraFree( is_free ):Void;
    public static function GameRegenItemAction( entity_id:EntityId ):Void;
    public static function GameRegenItemActionsInContainer( entity_id:EntityId ):Void;
    public static function GameRegenItemActionsInPlayer( entity_id:EntityId ):Void;
    public static function GameKillInventoryItem( inventory_owner_entity_id, item_entity_id ):Void;
    public static function GameKillInventoryItem( who_picks_up_entity_id, item_entity_id ):Void;
    public static function GameDropAllItems( entity_id:EntityId ):Void;
    public static function LoadPixelScene( string materials_filename:String, string colors_filename:String, x:Int, y:Int, string background_file, skip_biome_checks = false, skip_edge_textures = false, color_to_material_table = {} ):Void;
    public static function GameCreateParticle( string material_name, x:Int, y:Int, how_many:Int, xvel, yvel, just_visual, ?draw_as_long ):Void;
    public static function GameShootProjectile( who_shot, x:Int, y:Int, target_x:Int, target_y:Int, projectile_entity:Int, send_message ):Void;
    public static function GamePlayAnimation( entity_id:EntityId, name, priority:Int, [followup_name], [followup_priority] ):Void;
    public static function GameGetVelocityCompVelocity( entity_id:EntityId ):Vector2;
    public static function GameGetGameEffect( entity_id:EntityId, string GAME_EFFECT ):ComponentId;
    public static function GameGetGameEffectCount( entity_id:EntityId, string GAME_EFFECT ) -> uint;
    public static function SetPlayerSpawnLocation( x:Int, y ):Void;
    public static function UnlockItem( action_id ):Void;
    public static function GameGetPotionColor( entity_id:EntityId ) -> uint;
    public static function Raytrace( x1, y1, x2, y2 ) -> did_hit,hit_x:Int,hit_y;
    public static function FindFreePositionForBody( ideal_pos_x:Int, idea_pos_y:Int, velocity_x:Int, velocity_y:Int, body_radius ):Vector2;
    public static function GetSurfaceNormal( pos_x:Int, pos_y:Int, ray_length, ray_count ) -> found_normal,normal_x:Int,normal_y:Int,approximate_distance_from_surface;
    public static function GenomeSetHerdId( entity_id:EntityId, string new_herd_id ):Void;
    public static function GamePrint( string log_line ):Void;
    public static function GamePrintImportant( string title, description ):Void;
    public static function DEBUG_GetMouseWorld():Vector2;
    public static function DEBUG_MARK( x:Int, y:Int, string message="", color_r=1, color_g=0, color_b=0 ):Void;
    public static function GameGetFrameNum():Int;
    public static function GameGetRealWorldTimeSinceStarted():Float;
    public static function IsPlayer( entity ):Bool;
    public static function GameIsDailyRun( entity ):Bool;
    public static function GlobalsSetValue( key:Int, value ):Void;
    public static function GlobalsGetValue( key:Int, default_value = "" ):Void;
    public static function MagicNumbersGetValue( key ):Void;
    public static function AutosaveDisable():Void;
    public static function StatsGetValue( key ):String;
    public static function StatsBiomeGetValue( key ):String;
    public static function StatsBiomeReset():Void;
    public static function StatsLogPlayerKill():Void;
    public static function CreateItemActionEntity( action_id, ?x:Int, ?y ):EntityId;
    public static function GetRandomActionWithType( x:Int, y:Int, max_level, type, i = 0):String;
    public static function BiomeMapSetSize( w, h )
    // [This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.];
    public static function BiomeMapGetSize() -> w,h
    // [This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.];
    public static function BiomeMapSetPixel( x:Int, y:Int, color_int )
     //[This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.];
    public static function BiomeMapGetPixel( x:Int, y ) -> color_int
     //[This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.];
    public static function BiomeMapLoadImage( x:Int, y:Int, path ) 
    //[This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.];
    public static function BiomeMapLoadImageCropped( x:Int, y:Int, path, image_x:Int, image_y:Int, image_w, image_h ) 
    //[This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.];
    public static function BiomeMapGetVerticalPositionInsideBiome( x:Int, y ):Float;
    public static function BiomeMapGetName( ?x:Int, ?y ) -> name;
    public static function SetRandomSeed(x:Int,y):Void;
    public static function Random( ?a, ?b ):Float|int.
     //[This is kinda messy. If given 0 arguments, returns number between 0 and 1. If given 1 arguments, returns int between 0 and 'a'. If given 2 arguments returns int between 'a' and 'b'.];
    public static function ProceduralRandom( x:Int, y:Int, (min,max) ):Int|number [See Random() documentation.];
    public static function RandomDistribution( min, max:Int, mean, (sharpness=1.f), (baseline=0.005) ):Int;
    public static function RandomDistributionf( min, max:Int, mean, (sharpness=1.f), (baseline=0.005) ):Float;
    public static function PhysicsAddBodyImage( entity_id:EntityId, image_file, material = "", offset_x = 0, offset_y = 0, bool centered = false, bool is_circle = false, material_image_file = "" ):Int_body_id;
    public static function PhysicsAddBodyImage( entity_id:EntityId, material, offset_x:Int, offset_y:Int, width, height, bool centered = false ):Int_body_id|nil;
    public static function PhysicsAddJoint( entity_id:EntityId, body_id0, body_id1, offset_x:Int, offset_y:Int, string joint_type ):Int_joint_id;
    public static function PhysicsApplyForce( entity_id:EntityId, float force_x:Int, float force_y ):Void;
    public static function PhysicsApplyTorque( entity_id:EntityId, float torque ):Void;
    public static function PhysicsApplyTorqueToComponent( entity_id:EntityId, component_id:ComponentId, float torque ):Void;
    public static function PhysicsRemoveJoints( world_pos_min_x:Int, world_pos_min_y:Int, world_pos_max_x:Int, world_pos_max_y  ):Void;
    public static function PhysicsSetStatic( entity_id:EntityId, bool is_static ):Void;
    public static function PhysicsGetComponentVelocity( entity_id:EntityId, component_id:ComponentId ) -> vel_x:Int,vel_y;
    public static function PhysicsGetComponentAngularVelocity( entity_id:EntityId, component_id:ComponentId ) -> vel;
    public static function PhysicsVecToGameVec( x:Int, ?y ):Vector2;
    public static function GameVecToPhysicsVec( x:Int, ?y ):Vector2;
    public static function LooseChunk( world_pos_x:Int, world_pos_y:Int, image_filename:String, ? max_durability ):Void;
    public static function LoadGameEffectEntityTo( entity_id:EntityId, string game_effect_entity_file ) -> effect_entity_id;
    public static function GetGameEffectLoadTo( entity_id:EntityId, string game_effect_entity_file, always_load_new ) -> effect_component_id;
    public static function AddFlagPersistent( key ):Bool_is_new;
    public static function RemoveFlagPersistent( key ):Void;
    public static function HasFlagPersistent( key ):Bool;
    public static function GameAddFlagRun( flag ):Void;
    public static function GameRemoveFlagRun( flag ):Void;
    public static function GameHasFlagRun( flag ):Bool;
    public static function GameTriggerMusicEvent( event_path, can_be_faded, x:Int, y ):Void;
    public static function GameTriggerMusicCue( name ):Void;
    public static function GameTriggerMusicFadeOutAndDequeueAll( ?relative_fade_speed ):Void;
    public static function GamePlaySound( bank_filename:String, event_path, x:Int, y ):Void;
    public static function GameEntityPlaySound( entity:Int, event_name ):Void;
    public static function GameTextGetTranslatedOrNot( text_or_key ):String;
    public static function GameTextGet( key:Int, ? param0, ? param1, ? param2 ):String;
    public static function GuiCreate() -> gui;
    public static function GuiDestroy( gui ):Void;
    public static function GuiStartFrame( gui ):Void;
    public static function GuiText( gui, x:Int, y:Int, text ):Void;
    public static function GuiTextCentered( gui, x:Int, y:Int, text ):Void;
    public static function GuiButton( gui, x:Int, y:Int, text, id ):Bool_clicked;
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
    public static function EntityConvertToMaterial( entity_id:EntityId, string material ):Void;
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
    public static function SetValueInt( key:Int, value ):Void;
    public static function GetValueInt( key:Int, default_value ):Void;
    public static function SetValueNumber( key:Int, value ):Void;
    public static function GetValueNumber( key:Int, default_value ):Void;
    public static function SetValueBool( key:Int, value ):Void;
    public static function GetValueBool( key:Int, default_value ):Void;
    */
}