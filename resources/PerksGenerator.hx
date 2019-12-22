package resources;
//import lua.Table;
import lua.Lua;
import lua.Io;
import noita.Noita;
import noita.Files;

typedef Perk=
{
    final id:String;
    final ui_name:String;
    final ui_description:String;
    final ui_icon:String;
    final perk_icon:String;
    final game_effect:String;
    final stackable:String;
}

class PerksGenerator
{
    public static function generate()
    {
        final filestr:String = "C:/Users/takashi/AppData/LocalLow/Nolla_Games_Noita/data/scripts/perks/perk_list.lua";//Files.perkList;
        Lua.dofile(filestr);
        final fh=Io.open("./src/noita/PerkList.hx","w");
        final header ="enum abstract PerkList(String)\n{";
        fh.write(header);

        untyped __lua__("for key,value in pairs(perk_list) do");
        final perk:Perk = untyped (value);
        fh.write("\tfinal "+ perk.id+ ";\n");

        untyped __lua__("end");
        fh.write("	inline function new(str:String)
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
	}");
        final footer="\n}\n";
        fh.write(footer);
    }
    public static function main()
    {
        generate();
    }
}