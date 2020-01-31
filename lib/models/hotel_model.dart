class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;

  Hotel({
    this.imageUrl,
    this.name,
    this.address,
    this.price,
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/hotel0.jpg',
    name: 'Hotel Transylvania',
    address: '015, Kenyatta Ave, Nrb',
    price: 17500,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel1.jpg',
    name: 'Hilton Hotel',
    address: '104, Kimathi St, Nrb',
    price: 30000,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel2.jpg',
    name: 'Villa Rosa Kempinski',
    address: '222, Uhuru Highway, Nrb ',
    price: 24000,
  ),
];
