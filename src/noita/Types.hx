package noita;

import haxe.extern.EitherType;

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
typedef Apparition={
    var integer:Int;
    var entityId:EntityId;
}
typedef EntityId=Null<Int>;