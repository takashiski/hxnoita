package noita;
enum abstract PerkList(String)
{	final CRITICAL_HIT;
	final BREATH_UNDERWATER;
	final EXTRA_MONEY;
	final EXTRA_MONEY_TRICK_KILL;
	final HOVER_BOOST;
	final MOVEMENT_FASTER;
	final LOW_GRAVITY;
	final SPEED_DIVER;
	final STRONG_KICK;
	final REPELLING_CAPE;
	final EXPLODING_CORPSES;
	final SAVING_GRACE;
	final INVISIBILITY;
	final GLOBAL_GORE;
	final REMOVE_FOG_OF_WAR;
	final VAMPIRISM;
	final EXTRA_HP;
	final HEARTS_MORE_EXTRA_HP;
	final GLASS_CANNON;
	final RESPAWN;
	final WORM_ATTRACTOR;
	final WORM_DETRACTOR;
	final PROTECTION_FIRE;
	final PROTECTION_RADIOACTIVITY;
	final PROTECTION_EXPLOSION;
	final PROTECTION_MELEE;
	final PROTECTION_ELECTRICITY;
	final TELEPORTITIS;
	final STAINLESS_ARMOUR;
	final EDIT_WANDS_EVERYWHERE;
	final ABILITY_ACTIONS_MATERIALIZED;
	final PROJECTILE_HOMING;
	final PROJECTILE_HOMING_SHOOTER;
	final FREEZE_FIELD;
	final DISSOLVE_POWDERS;
	final BLEED_SLIME;
	final BLEED_OIL;
	final SHIELD;
	final REVENGE_EXPLOSION;
	final REVENGE_TENTACLE;
	final ATTACK_FOOT;
	final PLAGUE_RATS;
	final PROJECTILE_REPULSION;
	final ELECTRICITY;
	final ATTRACT_ITEMS;
	final EXTRA_KNOCKBACK;
	final LOWER_SPREAD;
	final BOUNCE;
	final EXTRA_PERK;
	final PERKS_LOTTERY;
	final GENOME_MORE_HATRED;
	final GENOME_MORE_LOVE;
	inline function new(str:String)

	{

		this=str;

	}

	@:from static public inline function fromString(str:String)

	{

		return new PerkList(str);

	}

	@:to public inline function toString()

	{

		return this;

	}
}
