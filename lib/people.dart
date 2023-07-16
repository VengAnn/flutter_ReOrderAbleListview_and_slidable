class People {
  String id;
  String name;
  String gender;
  String email;
  String address;
  String photo;
  //constructor
  People(this.id, this.name, this.gender, this.email, this.address, this.photo);
  //
  static List<People> generate() {
    var ls = [
      People('1', 'Dasha Taran', 'FeMale', 'DashTaran@gmail.com', 'Korean',
          'https://www.sukhbeerbrar.com/wp-content/uploads/2021/11/taaarannn_103724574_263361155104304_1562130644305545690_n.jpg'),
      People('2', 'Baifern', 'FeMale', 'Baifern@gmail.com', 'Thai',
          'https://upload.wikimedia.org/wikipedia/commons/1/1f/Baifern_Pimchanok.png'),
    ];
    return ls;
  }
}
