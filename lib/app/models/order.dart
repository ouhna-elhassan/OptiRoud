class Order {
  final String type;
  final int prix;
  final String ligne;
  int tickets;
  bool state;
  int total = 0;

  Order(this.type, this.ligne, this.prix, this.state, this.tickets, this.total){}

}