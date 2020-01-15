import Xml;
import js.node.Fs;

class ModInit
{
    public static function main(){
        var root = Xml.createElement("Mod");
        root.set("name","mod name");
        root.set("description","mod description");
        root.set("request_no_api_restrictions","0");
        
        trace(root);
        Fs.writeFile("./test.xml",entity.toString(),(err)->{trace(err);});
    }
}