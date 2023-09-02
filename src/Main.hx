import js.node.Http;
import js.Node;
import actions.Currency;
import ActionRouter;

class Main {
    static function main() {
    // Configure our HTTP server to respond with Hello World to all requests.
    //new Console({ stdout: process.stdout, stderr: process.stderr });
    var server = Http.createServer(function(request, response) {
        trace(request.url);
      response.writeHead(200, {"Content-Type": "text/plain"});
      response.end("Hello World\n");
    });

    // Listen on port 8000, IP defaults to 127.0.0.1
    server.listen(8880);

    // Put a console.log on the terminal
    trace("Server running at 127.0.0.1:8880");
    //trace(Currency.axios);
    //trace(Node.process.env);
    var symbols = Reflect.fields(Currency.symbols);
    var data = new Map<String, String>();
    for(f in symbols){
      data.set(f, Reflect.field(Currency.symbols, f));
    }
    trace(data.get('CRC'));
    trace(data.get('TZS'));
    //trace(data.TZS);
  //trace(Currency.symbols);
    Currency.conversion_rates();
    ActionRouter.init();
  }
}