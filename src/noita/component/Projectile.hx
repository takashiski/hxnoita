package noita.component;

class Projectile
{

}

ProjectileComponent
 - Members -----------------------------
    lifetime                                                        -1 [0, 1]                       
/**
lifetime, -1 means it's endless, otherwise it's the frame count
    */
    lifetime_randomness                                             0 [0, 1]                        
/**
final lifetime will be lifetime + random(-lifetime_randomness,lifetime_randomness)
    */
    on_lifetime_out_explode                                         0 [0, 1]                        
/**
when lifetime runs out, should we explode?
    */
    collide_with_world                                              1 [0, 1]                        
/**
true by default. Some projectiles you don't want to collide with the world, e.g. blackholes
    */
    speed_min                                                       60 [0, 60000]                   
/**

    */
    speed_max                                                       60 [0, 60000]                   
/**

    */
    friction                                                        0 [0, 60000]                    
/**

    */
    direction_random_rad                                            0 [0, 3.14151]                  
/**
when fired, randomizes the velocity -this, this
    */
    direction_nonrandom_rad                                         0 [-3.14, 3.14]                 
/**
when fired, multiplies this with projectile_i and adds it to direction
    */
    lob_min                                                         0.5 [0, 60000]                  
/**

    */
    lob_max                                                         0.8 [0, 60000]                  
/**

    */
    camera_shake_when_shot                                          0 [0, 60000]                    
/**

    */
    shoot_light_flash_radius                                        0 [0, 60000]                    
/**

    */
    shoot_light_flash_r                                             255 [0, 255]                    
/**

    */
    shoot_light_flash_g                                             180 [0, 255]                    
/**

    */
    shoot_light_flash_b                                             150 [0, 255]                    
/**

    */
    create_shell_casing                                             0 [0, 1]                        
/**
should we create shell casings?
    */
    shell_casing_material                                           brass [0, 1]                    
/**
material of the shell casing
    */
    muzzle_flash_file                                               -                               
/**
this entity is created along with the projectile, oriented along the projectile's path
    */
    bounces_left                                                    0 [0, 1e+008]                   
/**

    */
    bounce_energy                                                   0.5 [0, 1]                      
/**
when bouncing, velocity is multiplied by this
    */
    bounce_always                                                   0 [0, 1]                        
/**
if true, will do a fake bounce if can't do the proper bounce, but will always try to bounce
    */
    bounce_at_any_angle                                             0 [0, 1]                        
/**
if true, will bounce at any reflection angle
    */
    attach_to_parent_trigger                                        0 [0, 1]                        
/**
if true, will attach to the projectile entity that created this projectile via a trigger
    */
    bounce_fx_file                                                  -                               
/**
this entity is created at the bounce position. it gets the bounce angle as rotation.
    */
    angular_velocity                                                0 [-3.1415, 3.1415]             
/**
this is only applied if velocity_sets_rotation == false
    */
    velocity_sets_rotation                                          1 [0, 1]                        
/**
whether we set the rotation based on velocity, as in spear or if we update the rotation with angular_velocity
    */
    velocity_sets_scale                                             0 [0, 1]                        
/**
if true, the sprite width is made equal to the distance traveled since last frame
    */
    velocity_sets_scale_coeff                                       1 [0, 1]                        
/**
Larger value means velocity affects the scale more
    */
    velocity_sets_y_flip                                            0 [0, 1]                        
/**
if true, the sprite is flipped based on which side the projectile is currently traveling
    */
    velocity_updates_animation                                      0 [0, 1]                        
/**
updates the animation based on far the sprite moved
    */
    ground_penetration_coeff                                        0 [0, 5]                        
/**
this, along with VelocityComponent.mass affects how far we penetrate in materials
    */
    go_through_this_material                                        -                               
/**
if set, we never collide with this material
    */
    on_death_duplicate_remaining                                    0 [0, 1]                        
/**
if greater than 0, the projectile creates two clones of itself on death. 'on_death_duplicate_remaining' on the clones is reduced by one
    */
    on_death_gfx_leave_sprite                                       1 [0, 1]                        
/**
if true, finds all the sprites and leaves as sand cells into the grid
    */
    on_death_explode                                                0 [0, 1]                        
/**
if true, does explosion with config_explosion
    */
    on_death_emit_particle                                          0 [0, 1]                        
/**
if true, emits on_death_emit_particle_type on death
    */
    on_death_emit_particle_count                                    1 [0, 1]                        
/**
how many particles should we emit
    */
    die_on_liquid_collision                                         0 [0, 1]                        
/**
if true, dies on collision with liquids
    */
    die_on_low_velocity                                             0 [0, 1]                        
/**
if true, dies when speed goes below die_on_low_velocity_limit
    */
    die_on_low_velocity_limit                                       50 [0, 1]                       
/**
please see die_on_low_velocity
    */
    on_death_emit_particle_type                                     -                               
/**

    */
    on_death_particle_check_concrete                                0 [0, 1]                        
/**
if you want it to stick as concrete, you should enable this
    */
    ground_collision_fx                                             1 [0, 1]                        
/**
if 1, spurt some particles when colliding with mortals
    */
    explosion_dont_damage_shooter                                   0 [0, 1]                        
/**
if true, explosion doesn't damage the entity who shot this
    */
    on_death_item_pickable_radius                                   0 [0, 1]                        
/**
if > 0, makes items closer than this radius pickable on death
    */
    penetrate_world                                                 0 [0, 1]                        
/**
if true, the projectile doesn't collide with ground, liquids, physical objects etc
    */
    penetrate_world_velocity_coeff                                  0.6 [0, 1]                      
/**
if 'penetrate_world' is true, the projectile moves with a velocity multiplied by this value when inside world
    */
    penetrate_entities                                              0 [0, 1]                        
/**
if true, the projectile doesn't stop when it collides with entities. damages each entity only once
    */
    on_collision_die                                                1 [0, 1]                        
/**
if true, this is killed as soon as it hits the ground
    */
    on_collision_remove_projectile                                  0 [0, 1]                        
/**
if true, ProjectileComponent is removed from the entitiy
    */
    on_collision_spawn_entity                                       1 [0, 1]                        
/**
if true, spawns the spawn_entity
    */
    spawn_entity                                                    -                               
/**
this is spawned if hit something an on_collision_spawn_entity = 1
    */
    spawn_entity_is_projectile                                      0 [0, 1]                        
/**
if true, will use ShootProjectile instead of LoadEntity()
    */
    physics_impulse_coeff                                           300 [0, 1]                      
/**
projectile applies an impulse to physics bodies it hits. Impulse = physics_impulse_coeff * velocity
    */
    damage_every_x_frames                                           -1 [0, 1]                       
/**
if set != -1, will only do damage every x frames, used for fields and such, which would otherwise do damage every frame
    */
    damage_scaled_by_speed                                          0 [0, 1]                        
/**
if 1, damage is multiplied by (projectile speed / original projectile speed) ratio
    */
    collide_with_entities                                           1 [0, 1]                        
/**
if 1, looks for entities with tag, collide_with_tag and collides with them, giving them damage
    */
    collide_with_tag                                                hittable [0, 1]                 
/**
default: mortal, if you needed can be changed to something more specific
    */
    collide_with_shooter_frames                                     -1 [0, 1]                       
/**
remember friendly_fire 1, if -1 won't collide with shooter at all, otherwise uses the value as frame count and while it's running won't damage the shooter 
    */
    friendly_fire                                                   0 [0, 1]                        
/**
if true, will damage same herd id
    */
    damage                                                          1 [0, 1]                        
/**
how much Projectile damage does this do when it hits something
    */
    knockback_force                                                 0 [0, 1]                        
/**
How far do entities get thrown if a knockback occurs. final_knockback = ProjectileComponent.knockback_force * VelocityComponent.mVelocity * VelocityComponent.mass / who_we_hit.mass
    */
    ragdoll_force_multiplier                                        0.025 [0, 1]                    "velocity * ragdoll_force_multiplier is applied to any ragdolls that are created by entities killed by this
    */
    hit_particle_force_multiplier                                   0.1 [0, 1]                      "hit particle velocity = projectile_velocity * hit_particle_force_multiplier * some randomness
    */
    blood_count_multiplier                                          1 [0, 1]                        "how much blood does this projectile cause
    */
    damage_game_effect_entities                                     -                               "a list of game_effects entities separated with ','. e.g. 'data/entities/misc/effect_electrocution.xml,data/entities/misc/effect_on_fire.xml' 
    */
    never_hit_player                                                0 [0, 1]                        "If 1, does not hit player no matter what herds this and player belong to
    */
    collect_materials_to_shooter                                    0 [0, 1]                        "if 1, looks up the 'who_shot' entity and its MaterialInventoryComponent on destruction and updates it based on the cells destroyed on our explosion.
    */
    play_damage_sounds                                              1 [0, 1]                        "
    */
    mLastFrameDamaged                                               -1024 [0, 1]                    "
    */
 - Objects -----------------------------
    config                                                          -                               "
    */
    config_explosion                                                -                               "if we have explosion, it's the setup for it
    */
    damage_by_type                                                  -                               "the amounts of different types of damage this does
    */
    damage_critical                                                 -                               "config for critical hit
    */
 - Privates -----------------------------
    mWhoShot                                                        0 [0, 1]                        "
    */
    mWhoShotEntityTypeID                                            0 [0, 1]                        "used for stats
    */
    mShooterHerdId                                                  0 [0, 1]                        "
    */
    mStartingLifetime                                               0 [0, 1]                        "
    */
    mTriggers                                                       -                               "
    */
    mDamagedEntities                                                -                               "
    */
    mInitialSpeed                                                   -1 [0, 1]                       "
    */