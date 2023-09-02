#if macro
import haxe.io.Path;
import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Type;
import sys.FileSystem;
import sys.io.File;
#end

class Macros {
  //public static macro function getRoutes():ExprOf<Array<String> >{
  public static macro function getRoutes() {
    
    //var fields:Array<Field> = Context.getBuildFields();
    
    // get the path of the current current class file, e.g. "src/path/to/MyClassName.hx"
    var posInfos = Context.getPosInfos(Context.currentPos());
    var directory = Path.directory(posInfos.file)+'/actions';

    trace(directory);
    var fields:Array<String> = FileSystem.readDirectory(directory);
    
    // get the current class information. 
    //var ref:ClassType = Context.getLocalClass().get();
   
    //trace(ref);
    
    // convert to expr
    var exprs = [];
    for (filePath in fields) {
      // get the file content of the template 
      //var fileContent:String = File.getContent(filePath);
      exprs.push(macro $v{filePath});
      // add a static field called "TEMPLATE" to the current fields of the class
      //fields.push(filePath);
      trace(filePath);
    }
    
    //return macro ["a","b","c"];
    return macro $a{exprs};
  }
}