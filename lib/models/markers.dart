class MarkerData {
  final String name, locationLat, locationLon, subTitle, desc;
  final bool isActive;
  final int id;
 

  MarkerData({
    this.id = 0,
    this.name = '',
    this.locationLat = '',
    this.locationLon = '',
    this.subTitle = '',
    this.desc = '',
    this.isActive = false,
  });
}

List markerListData = [
  MarkerData(
    id: 1,
    name: "United Hospital",
    locationLat: "23.7940686",
    locationLon: "90.3909605",
    subTitle: "Paracetamol",
    desc: "Baridhara Dohs",
    isActive: false,
  ),
  MarkerData(
    id: 2,
    name: "Badda General Hospital",
    locationLat: "23.7844949",
    locationLon: "90.4080054",
    subTitle: "Paracetamol",
    desc: "North Badda",
    isActive: true,
  ),
  MarkerData(
    id: 3,
    name: "Kurmitola Hospital",
    locationLat: "23.8191217",
    locationLon: "90.3918958",
    subTitle: "Paracetamol",
    desc: "Airport road ,Dhaka",
    isActive: false,
  ),
  MarkerData(
    id: 4,
    name: "Square Hospital",
    locationLat: "23.7827306",
    locationLon: "90.3595007",
    subTitle: "Paracetamol",
    desc: "Mirpur Road,Dhaka",
    isActive: false,
  ),
  MarkerData(
    id: 5,
    name: "Universal Hospital",
    locationLat: "23.7827306",
    locationLon: "90.3595007",
    subTitle: "Paracetamol",
    desc: "Banani, Dhaka",
    isActive: true,
  ),

];