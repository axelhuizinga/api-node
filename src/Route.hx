//package actions;

class Route {

    public static var all:Array<String> = Macros.getRoutes().map(function (s:String ):String {
        //var r = ~/{(\w)}/i;
        var r = ~/[a-z]+/i;
        return(r.match(s)?r.matched(0):'');
            //var pos = r.matchedPos();
        //trace(r.matchedPos());
        //trace(r.matched(0));
        //trace(r.matchedRight());
        //return r.replace(s, "$1");
        
    });
    //Fs.readdirSync(process.env['PWD']+SRC_ACTIONS);

    public static function init():Void {
        trace(all);
        for(f in all){
            trace(f);
        }
    }
}