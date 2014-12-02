part of dartrest;

@Controller
class CountController {
  int count = 0;
  
  CountController() {
    count = 1;
  }
  
  @RequestMapping(value: "/json",method: RequestMethod.GET)
  Foo countJson(req) {
    DateTime now = new DateTime.now();
    Random r = new Random(now.second);
    Foo f = new Foo(now.toString(),r.nextInt(100).toString());
    return f;
  }
}