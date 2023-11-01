class UrlNames{
  static const String baseUrl='https://jsonplaceholder.typicode.com';
  static const String usersUrl='$baseUrl/users';
  static const String postsUrl='$baseUrl/posts';
  static String postDeleteUrl(int id)=>'$baseUrl/posts/$id';


}