package noita.gun.procedural;

import noita.Types;
import noita.Entity;
import noita.wand.Spells;

typedef ActionId=Spells;

@:native("_G")
extern class GunActionUtils
{
  public static function AddGunActionPermanent(entityId:EntityId, ActionId:ActionId):Void;
  public static function AddGunAction(entityId:EntityId,actionId:ActionId):Void;
}