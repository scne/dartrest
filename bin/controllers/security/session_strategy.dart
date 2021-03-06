part of dartrest;

class SessionStrategy extends SecurityStrategy {
  
  bool checkAuthorization(HttpRequest req, List<String> roles, data) {
    HttpSession session = req.session;
    return (session["user"]!=null && roles.any((r) => r == session["user"]));
  }   
  
  Uri getRedirectUri(HttpRequest req) {
    var referer = req.uri.toString();
    return Uri.parse("/login/?referer=$referer");
  }
}