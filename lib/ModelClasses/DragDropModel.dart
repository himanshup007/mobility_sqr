class DragDropModel {
  int index;
  int where;
  String image;
  String first_text;
  String second_text;
  DragDropModel({this.index, this.image, this.first_text,this.second_text,this.where});

  @override
  String toString() {
    return '$index : $first_text';
  }
}