
enum Fromwho {
  me, his}

class Message {

  final String text;
  final String? imageUrl;
  final Fromwho fromwho;

  Message ({
    required this.fromwho,
    required this.text,
    this.imageUrl
    });
}