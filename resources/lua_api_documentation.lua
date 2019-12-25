lua_readtable()
EntityLoad( filename, [optional]pos_x, [optional]pos_y ) -> entity_id
EntityLoadCameraBound( filename, [optional]pos_x, [optional]pos_y )
EntitySave( entity_id, filename ) (note: works only in dev builds)
EntityCreateNew( [optional]name ) -> entity_id
EntityKill( entity_id )
EntityIsAlive( entity_id ) -> bool
EntityAddComponent( entity_id, component_type_name, [optional]table_of_component_values ) -> component_id
EntityRemoveComponent( entity_id, component_id )
EntityGetAllComponents( entity_id ) -> {component_id}
EntityGetComponent( entity_id, component_type_name ) -> {component_id}|nil
EntityGetFirstComponent( entity_id, component_type_name, [optional]tag ) -> component_id
EntitySetTransform( entity_id, x, [optional]y, [optional]rotation, [optional]scale_x, [optional]scale_y )
EntityGetTransform( entity_id ) -> x,y,rotation,scale_x,scale_y
EntityAddChild( parent_id, child_id )
EntityGetAllChildren( entity_id ) -> {entity_id}|nil
EntityGetParent( entity_id ) -> entity_id
EntityRemoveFromParent( entity_id )
EntitySetComponentsWithTagEnabled( entity_id, tag, enabled )
EntitySetComponentIsEnabled( entity_id, component_id, is_enabled )
EntityGetName( entity_id ) -> string
EntitySetName( entity_id, name )
EntityGetTags( entity_id ) -> string|nil [string is comma separated]
EntityGetWithTag( entity_tag ) -> {entity_id}
EntityGetInRadius( pos_x, pos_y, radius ) -> {entity_id}
EntityGetInRadiusWithTag( pos_x, pos_y, radius, entity_tag ) -> {entity_id}
EntityGetClosest( pos_x, pos_y ) -> entity_id
EntityGetClosestWithTag( pos_x, pos_y, string tag ) -> entity_id
EntityGetWithName( name ) -> entity_id
EntityAddTag( entity_id, tag )
EntityRemoveTag( entity_id, tag )
EntityHasTag( entity_id, tag ) -> bool
ComponentGetValue( component_id, variable_name ) -> string|nil
ComponentGetValueBool( component_id, variable_name ) -> bool
ComponentGetValueInt( component_id, variable_name ) -> int
ComponentGetValueFloat( component_id, variable_name ) -> number
ComponentGetValueVector2( component_id, variable_name ) -> x,y
ComponentGetVectorSize( component_id, array_member_name, type_of_vector ) -> int
ComponentGetVectorValue( component_id, array_name, type, i ) -> multiple return types|nil
ComponentGetVector( component_id, array_name, type ) -> {multiple types}|nil
ComponentSetValue( component_id, variable_name, value )
ComponentSetValueVector2( component_id, variable_name, x, y )
ComponentSetValueValueRange( component_id, variable_name, min, max )
ComponentSetValueValueRangeInt( component_id, variable_name, min, max )
ComponentSetMetaCustom( component_id, variable_name, value )
ComponentGetMetaCustom( component_id, variable_name ) -> string|nil
ComponentGetMembers( component_id ) -> {string-string} [returns a string-indexed table of string]
ComponentObjectGetValue( component_id, object_name, variable_name ) -> string|nil
ComponentObjectGetValueBool( component_id, object_name, variable_name ) -> string|nil
ComponentObjectGetValue( component_id, object_name, variable_name ) -> string|nil
ComponentObjectGetValue( component_id, object_name, variable_name ) -> string|nil
ComponentObjectSetValue( component_id, object_name, variable_name, value )
ComponentObjectGetMembers( component_id, object_name ) -> {string-string}|nil [returns a string-indexed table of string]
GetUpdatedEntityID() -> entity_id
GetUpdatedComponentID() -> component_id
RegisterSpawnFunction( uint32 color, string function_name )
SpawnActionItem( x, y, level )
SpawnStash( x, y, level, action_count ) -> entity_id
SpawnApparition( x, y, level ) -> int,entity_id
LoadEntityToStash( entity_file, stash_id )
AddMaterialInventoryMaterial( entity_id, material_name, count )
GameScreenshake( strength, [optional]pos_x, [optional]pos_y )
GameOnCompleted()
GameDoEnding2()
GameIsIntroPlaying() -> bool
GameGetIsGamepadConnected() -> bool
GameGetWorldStateEntity() -> entity_id
GameGetPlayerStatsEntity() -> entity_id
GameGetOrbCountAllTime() -> int
GameGetOrbCountThisRun() -> int
GameGetOrbCollectedThisRun( int orb_id_zero_based ) -> bool
GameGetOrbCollectedAllTime( int orb_id_zero_based ) -> bool
CellFactory_GetName( int material_id ) -> string
CellFactory_GetType( string material_name ) -> int
CellFactory_GetAllLiquids( include_statics = true ) -> {string}
CellFactory_GetAllSands( include_statics = true ) -> {string}
CellFactory_GetAllGases( include_statics = true ) -> {string}
CellFactory_GetAllFires( include_statics = true ) -> {string}
CellFactory_GetAllSolids( include_statics = true ) -> {string}
GameGetCameraPos() -> x,y
GameSetCameraPos( x, y )
GameSetCameraFree( is_free )
GameRegenItemAction( entity_id )
GameRegenItemActionsInContainer( entity_id )
GameRegenItemActionsInPlayer( entity_id )
GameKillInventoryItem( inventory_owner_entity_id, item_entity_id )
GameKillInventoryItem( who_picks_up_entity_id, item_entity_id )
GameDropAllItems( entity_id )
LoadPixelScene( string materials_filename, string colors_filename, x, y, string background_file, skip_biome_checks = false, skip_edge_textures = false, color_to_material_table = {} )
GameCreateParticle( string material_name, x, y, how_many, xvel, yvel, just_visual, [optional]draw_as_long )
GameShootProjectile( who_shot, x, y, target_x, target_y, projectile_entity, send_message )
GamePlayAnimation( entity_id, name, priority, [followup_name], [followup_priority] )
GameGetVelocityCompVelocity( entity_id ) -> x,y
GameGetGameEffect( entity_id, string GAME_EFFECT ) -> component_id
GameGetGameEffectCount( entity_id, string GAME_EFFECT ) -> uint
SetPlayerSpawnLocation( x, y )
UnlockItem( action_id )
GameGetPotionColor( entity_id ) -> uint
Raytrace( x1, y1, x2, y2 ) -> did_hit,hit_x,hit_y
FindFreePositionForBody( ideal_pos_x, idea_pos_y, velocity_x, velocity_y, body_radius ) -> x,y
GetSurfaceNormal( pos_x, pos_y, ray_length, ray_count ) -> found_normal,normal_x,normal_y,approximate_distance_from_surface
GenomeSetHerdId( entity_id, string new_herd_id )
GamePrint( string log_line )
GamePrintImportant( string title, description )
DEBUG_GetMouseWorld() -> x,y
DEBUG_MARK( x, y, string message="", color_r=1, color_g=0, color_b=0 )
GameGetFrameNum() -> int
GameGetRealWorldTimeSinceStarted() -> number
IsPlayer( entity ) -> bool
GameIsDailyRun( entity ) -> bool
GlobalsSetValue( key, value )
GlobalsGetValue( key, default_value = "" )
MagicNumbersGetValue( key )
AutosaveDisable()
StatsGetValue( key ) -> string
StatsBiomeGetValue( key ) -> string
StatsBiomeReset()
StatsLogPlayerKill()
CreateItemActionEntity( action_id, [optional]x, [optional]y ) -> entity_id
GetRandomActionWithType( x, y, max_level, type, i = 0) -> string
BiomeMapSetSize( w, h ) [This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.]
BiomeMapGetSize() -> w,h [This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.]
BiomeMapSetPixel( x, y, color_int ) [This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.]
BiomeMapGetPixel( x, y ) -> color_int [This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.]
BiomeMapLoadImage( x, y, path ) [This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.]
BiomeMapLoadImageCropped( x, y, path, image_x, image_y, image_w, image_h ) [This is available if BIOME_MAP in magic_numbers.xml points to a lua file, in the context of that file.]
BiomeMapGetVerticalPositionInsideBiome( x, y ) -> number
BiomeMapGetName( [optional]x, [optional]y ) -> name
SetRandomSeed(x,y)
Random( [optional]a, [optional]b ) -> number|int. [This is kinda messy. If given 0 arguments, returns number between 0 and 1. If given 1 arguments, returns int between 0 and 'a'. If given 2 arguments returns int between 'a' and 'b'.]
ProceduralRandom( x, y, (min,max) ) -> int|number [See Random() documentation.]
RandomDistribution( min, max, mean, (sharpness=1.f), (baseline=0.005) ) -> int
RandomDistributionf( min, max, mean, (sharpness=1.f), (baseline=0.005) ) -> number
PhysicsAddBodyImage( entity_id, image_file, material = "", offset_x = 0, offset_y = 0, bool centered = false, bool is_circle = false, material_image_file = "" ) -> int_body_id
PhysicsAddBodyImage( entity_id, material, offset_x, offset_y, width, height, bool centered = false ) -> int_body_id|nil
PhysicsAddJoint( entity_id, body_id0, body_id1, offset_x, offset_y, string joint_type ) -> int_joint_id
PhysicsApplyForce( entity_id, float force_x, float force_y )
PhysicsApplyTorque( entity_id, float torque )
PhysicsApplyTorqueToComponent( entity_id, component_id, float torque )
PhysicsRemoveJoints( world_pos_min_x, world_pos_min_y, world_pos_max_x, world_pos_max_y  )
PhysicsSetStatic( entity_id, bool is_static )
PhysicsGetComponentVelocity( entity_id, component_id ) -> vel_x,vel_y
PhysicsGetComponentAngularVelocity( entity_id, component_id ) -> vel
PhysicsVecToGameVec( x, [optional]y ) -> x,y
GameVecToPhysicsVec( x, [optional]y ) -> x,y
LooseChunk( world_pos_x, world_pos_y, image_filename, [optional] max_durability )
LoadGameEffectEntityTo( entity_id, string game_effect_entity_file ) -> effect_entity_id
GetGameEffectLoadTo( entity_id, string game_effect_entity_file, always_load_new ) -> effect_component_id
AddFlagPersistent( key ) -> bool_is_new
RemoveFlagPersistent( key )
HasFlagPersistent( key ) -> bool
GameAddFlagRun( flag )
GameRemoveFlagRun( flag )
GameHasFlagRun( flag ) -> bool
GameTriggerMusicEvent( event_path, can_be_faded, x, y )
GameTriggerMusicCue( name )
GameTriggerMusicFadeOutAndDequeueAll( [optional]relative_fade_speed )
GamePlaySound( bank_filename, event_path, x, y )
GameEntityPlaySound( entity, event_name )
GameTextGetTranslatedOrNot( text_or_key ) -> string
GameTextGet( key, [optional] param0, [optional] param1, [optional] param2 ) -> string
GuiCreate() -> gui
GuiDestroy( gui )
GuiStartFrame( gui )
GuiText( gui, x, y, text )
GuiTextCentered( gui, x, y, text )
GuiButton( gui, x, y, text, id ) -> bool_clicked
GuiLayoutBeginHorizontal( gui, x_rel, y_rel )
GuiLayoutBeginVertical( gui, x_rel, y_rel  )
GuiLayoutAddHorizontalSpacing( gui )
GuiLayoutAddVerticalSpacing( gui )
GuiLayoutEnd( gui )
DebugGetIsDevBuild() -> bool
DebugEnableTrailerMode()
GameGetIsTrailerModeEnabled() -> bool
Debug_SaveTestPlayer() [This doesn't do anything at the moment.]
EntityConvertToMaterial( entity_id, string material )
ConvertEverythingToGold()
ModLuaFileAppend( to_filename, from_filename )
ModMagicNumbersFileAdd( filename )
ModMaterialsFileAdd( filename )
ModRegisterAudioEventMappings( filename )
ModDevGenerateSpriteUVsForDirectory( directory_path ) [Only available via noita_dev.exe]
RegisterProjectile( entity_filename )
RegisterGunAction()
RegisterGunShotEffects()
BeginProjectile( entity_filename )
EndProjectile()
BeginTriggerTimer( timeout_frames )
BeginTriggerHitWorld()
BeginTriggerDeath()
EndTrigger()
SetProjectileConfigs()
StartReload( reload_time )
ActionUsesRemainingChanged( inventoryitem_id, uses_remaining )
ActionUsed( inventoryitem_id )
LogAction( action_name )
OnActionPlayed( action_id )
BaabInstruction( name )
OnNotEnoughManaForAction()
SetValueInt( key, value )
GetValueInt( key, default_value )
SetValueNumber( key, value )
GetValueNumber( key, default_value )
SetValueBool( key, value )
GetValueBool( key, default_value )
dofile( filename ) -> nil|script_return_type|nil,error_string [Returns the script's return value, if any. Returns nil,error_string if the script had errors.]
dofile_once( filename ) -> nil|script_return_type|nil,error_string [Runs the script only once per lua context, returns the script's return value, if any. Returns nil,error_string if the script had errors. For performance reasons it is recommended scripts use dofile_once(), unless the standard dofile behaviour is required.]
