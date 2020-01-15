package noita;

//todo:asign correct type(string)
typedef AbilityComponent={
  var cooldown_frames:Int;
  var entity_file:String;
  var sprite_file:String;
  var entity_count:Int;
  var never_reload:Int;
  var reload_time_frames:Int;
  var mana:Int;
  var mana_max:Int;
  var mana_charge_speed:Int;
  var rotate_in_hand:Int;
  var rotate_in_hand_amount:Int;
  var rotate_hand_amount:Int;
  var fast_projectile:Int;
  var swim_propel_amount:Int;
  var max_charged_actions:Int;
  var charge_wait_frames:Int;
  var item_recoil_recovery_speed:Int;
  var item_recoil_max:Int;
  var item_recoil_offset_coeff:Int;
  var item_recoil_rotation_coeff:Int;
  var base_item_file:String;
  var use_entity_file_as_projectile_info_proxy:Int;
  var shooting_reduces_amount_in_inventory:Int;
  var throw_as_item:Int;
  var simulate_throw_as_item:Int;
  var max_amount_in_inventory:Int;
  var amount_in_inventory:Int;
  var drop_as_item_on_death:Int;
  var ui_name:String;
  var use_gun_script:String;
  var is_petris_gun:Int;
  var add_these_child_actions:Int;
  var current_slot_durability:Int;
  var slot_consumption_function:String;
  var mChargeCount:Int;
  var mIsInitialized:Int;
}