import lua.Lua;
import noita.Files;
import noita.Noita;
import noita.Flags;
import noita.Entity;
import noita.Perks;

/*
@:expose
class Main
{
    @:expose("OnPlayerSpawned")
    public static function OnPlayerSpawned(player_entity:Int):Void
    {
        untyped __lua__('
        	local init_check_flag = "start_loadouts_init_done"
	if GameHasFlagRun( init_check_flag ) then
		return
	end
    GameAddFlagRun( init_check_flag )
        ');
        untyped __lua__("GamePrintImportant('runned mod test!')");
        untyped __lua__('
            local x,y = EntityGetTransform(player_entity)
    local perks = {"EXTRA_MONEY","EXTRA_HP","VAMPIRISM","REMOVE_FOG_OF_WAR"}
    for i,perk_name in ipairs(perks) do
        local perk_entity=perk_spawn(x,y,perk_name)
        perk_pickup(perk_entity,player_entity,EntityGetName(perk_entity),false,false)
    end
        ');
    }
    public static function main(){

        Lua.dofile(Files.perk);
        //Lua.setmetatable(untyped _G,untyped _hx_exports);
        Lua.rawset(untyped __lua__("_G"),"OnPlayerSpawned",Main.OnPlayerSpawned);
    }   
    public static function OnModPreInit()
    {
        untyped print("mod preinit");
    }

    public static function OnModInit(){untyped print("modinit");}

    public static function OnModPostInit(){untyped print("mod post init");}

    public static function OnWorldInitialized(){untyped print("world init ");}

    public static function OnWorldPreUpdate() {}

    public static function OnWorldPostUpdate(){}
}
*/


@:expose
class Main
{

    public static function OnPlayerSpawned(player_entity:Entity):Void
    {
        var init_check_flag = Flags.init_check_flag;
        if(Noita.GameHasFlagRun(init_check_flag))
        {
            return;
        }
        Noita.GameAddFlagRun(init_check_flag);
        var transform = Noita.EntityGetTransform(player_entity);
        var perks = new Array<String>();
        perks.push(Perks.extraMoney);
        perks.push(Perks.extraMoney);
        perks.push(Perks.heartsMoreExtraHp);
        perks.push(Perks.removeFogOfWar);
        perks.push(Perks.editWandsEverywhare);
        perks.push(Perks.respawn);
        perks.push(Perks.projectileHoming);
        for(perk in perks)
        {
            var perk_entity = Noita.perk_spawn(transform.x,transform.y,perk);
            Noita.perk_pickup(perk_entity,player_entity,Noita.EntityGetName(perk_entity),false,false);
        }
    }
    /*
    public static function OnModPreInit()
    {
    }

    public static function OnModInit(){}

    public static function OnModPostInit(){}

    public static function OnWorldInitialized(){}

    public static function OnWorldPreUpdate() {}

    public static function OnWorldPostUpdate(){}
*/
    public static function main()
    {
        Lua.dofile(Files.perk);
        Lua.rawset(untyped __lua__("_G"),"OnPlayerSpawned",Main.OnPlayerSpawned);
    }
}
