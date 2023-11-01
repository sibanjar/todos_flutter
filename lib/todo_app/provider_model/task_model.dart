
class Task{
    DateTime createdTime;
    String title;
    String id;
    String description;
    bool isDone;

    Task({
     required this.title,
     required this.createdTime,
      this.id='',
      this.description='',
      this.isDone=false
    });
}