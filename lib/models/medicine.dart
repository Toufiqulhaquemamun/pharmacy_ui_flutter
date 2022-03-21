class Medicine {
  final String name, mediType, image, genericName, producePharma;
  final bool isActive;

  Medicine({
    this.name = '',
    this.mediType = '',
    this.image = '',
    this.genericName = '',
    this.producePharma = '',
    this.isActive = false,
  });
}

List medicineData = [
  Medicine(
    name: "Napa 500mg",
    mediType: "Tablet",
    image: "https://cdn1.arogga.com/eyJidWNrZXQiOiJhcm9nZ2EiLCJrZXkiOiJtZWRpY2luZVwvMTJcLzEyNDc0LU5hcGEtNTAwLTUwMG1nLWJvYWMucG5nIiwiZWRpdHMiOnsicmVzaXplIjp7IndpZHRoIjoxMDAwLCJoZWlnaHQiOjEwMDAsImZpdCI6Im91dHNpZGUifSwib3ZlcmxheVdpdGgiOnsiYnVja2V0IjoiYXJvZ2dhIiwia2V5IjoibWlzY1wvd20ucG5nIiwiYWxwaGEiOjkwfX19",
    genericName: "Paracetamol",
    producePharma: "Beximco Pharmaceuticals Ltd.",
    isActive: false,
  ),
  Medicine(
    name: "Napa Extend 665mg",
    mediType: "Tablet",
    image: "https://cdn1.arogga.com/eyJidWNrZXQiOiJhcm9nZ2EiLCJrZXkiOiJtZWRpY2luZVwvMTJcLzEyNDc0LU5hcGEtNTAwLTUwMG1nLWJvYWMucG5nIiwiZWRpdHMiOnsicmVzaXplIjp7IndpZHRoIjoxMDAwLCJoZWlnaHQiOjEwMDAsImZpdCI6Im91dHNpZGUifSwib3ZlcmxheVdpdGgiOnsiYnVja2V0IjoiYXJvZ2dhIiwia2V5IjoibWlzY1wvd20ucG5nIiwiYWxwaGEiOjkwfX19",
    genericName: "Paracetamol",
    producePharma: "Beximco Pharmaceuticals Ltd.",
    isActive: true,
  ),
  Medicine(
    name: "Napa Extra 500mg",
    mediType: "Tablet",
    image: "https://cdn1.arogga.com/eyJidWNrZXQiOiJhcm9nZ2EiLCJrZXkiOiJtZWRpY2luZVwvMTJcLzEyNDc0LU5hcGEtNTAwLTUwMG1nLWJvYWMucG5nIiwiZWRpdHMiOnsicmVzaXplIjp7IndpZHRoIjoxMDAwLCJoZWlnaHQiOjEwMDAsImZpdCI6Im91dHNpZGUifSwib3ZlcmxheVdpdGgiOnsiYnVja2V0IjoiYXJvZ2dhIiwia2V5IjoibWlzY1wvd20ucG5nIiwiYWxwaGEiOjkwfX19",
    genericName: "Paracetamol",
    producePharma: "Beximco Pharmaceuticals Ltd.",
    isActive: false,
  ),
  Medicine(
    name: "Napa 120mg",
    mediType: "Syrup",
    image: "https://cdn1.arogga.com/eyJidWNrZXQiOiJhcm9nZ2EiLCJrZXkiOiJtZWRpY2luZVwvMjFcLzIxMTU5LU5hcGEtMTIwbWctNW1sLWVhcWIucG5nIiwiZWRpdHMiOnsicmVzaXplIjp7IndpZHRoIjoxMDAwLCJoZWlnaHQiOjEwMDAsImZpdCI6Im91dHNpZGUifSwib3ZlcmxheVdpdGgiOnsiYnVja2V0IjoiYXJvZ2dhIiwia2V5IjoibWlzY1wvd20ucG5nIiwiYWxwaGEiOjkwfX19",
    genericName: "Paracetamol",
    producePharma: "Beximco Pharmaceuticals Ltd.",
    isActive: true,
  ),
  Medicine(
    name: "Napa Rapid",
    mediType: "Tablet",
    image: "https://cdn1.arogga.com/eyJidWNrZXQiOiJhcm9nZ2EiLCJrZXkiOiJtZWRpY2luZVwvMTJcLzEyNDc0LU5hcGEtNTAwLTUwMG1nLWJvYWMucG5nIiwiZWRpdHMiOnsicmVzaXplIjp7IndpZHRoIjoxMDAwLCJoZWlnaHQiOjEwMDAsImZpdCI6Im91dHNpZGUifSwib3ZlcmxheVdpdGgiOnsiYnVja2V0IjoiYXJvZ2dhIiwia2V5IjoibWlzY1wvd20ucG5nIiwiYWxwaGEiOjkwfX19",
    genericName: "Paracetamol",
    producePharma: "Beximco Pharmaceuticals Ltd.",
    isActive: false,
  ),
  Medicine(
    name: "Napadol",
    mediType: "Tablet",
    image: "https://cdn1.arogga.com/eyJidWNrZXQiOiJhcm9nZ2EiLCJrZXkiOiJtZWRpY2luZVwvMTJcLzEyNDc0LU5hcGEtNTAwLTUwMG1nLWJvYWMucG5nIiwiZWRpdHMiOnsicmVzaXplIjp7IndpZHRoIjoxMDAwLCJoZWlnaHQiOjEwMDAsImZpdCI6Im91dHNpZGUifSwib3ZlcmxheVdpdGgiOnsiYnVja2V0IjoiYXJvZ2dhIiwia2V5IjoibWlzY1wvd20ucG5nIiwiYWxwaGEiOjkwfX19",
    genericName: "Paracetamol",
    producePharma: "Beximco Pharmaceuticals Ltd.",
    isActive: false,
  ),
  Medicine(
    name: "Napa drop",
    mediType: "Paediatric Drops",
    image: "https://cdn1.arogga.com/eyJidWNrZXQiOiJhcm9nZ2EiLCJrZXkiOiJtZWRpY2luZVwvMTJcLzEyNDc0LU5hcGEtNTAwLTUwMG1nLWJvYWMucG5nIiwiZWRpdHMiOnsicmVzaXplIjp7IndpZHRoIjoxMDAwLCJoZWlnaHQiOjEwMDAsImZpdCI6Im91dHNpZGUifSwib3ZlcmxheVdpdGgiOnsiYnVja2V0IjoiYXJvZ2dhIiwia2V5IjoibWlzY1wvd20ucG5nIiwiYWxwaGEiOjkwfX19",
    genericName: "Paracetamol",
    producePharma: "Beximco Pharmaceuticals Ltd.",
    isActive: true,
  ),
  Medicine(
    name: "Napa",
    mediType: "Tablet",
    image: "https://cdn1.arogga.com/eyJidWNrZXQiOiJhcm9nZ2EiLCJrZXkiOiJtZWRpY2luZVwvMTJcLzEyNDc0LU5hcGEtNTAwLTUwMG1nLWJvYWMucG5nIiwiZWRpdHMiOnsicmVzaXplIjp7IndpZHRoIjoxMDAwLCJoZWlnaHQiOjEwMDAsImZpdCI6Im91dHNpZGUifSwib3ZlcmxheVdpdGgiOnsiYnVja2V0IjoiYXJvZ2dhIiwia2V5IjoibWlzY1wvd20ucG5nIiwiYWxwaGEiOjkwfX19",
    genericName: "Paracetamol",
    producePharma: "Beximco Pharmaceuticals Ltd.",
    isActive: false,
  ),
  Medicine(
    name: "Napa",
    mediType: "Tablet",
    image: "https://cdn1.arogga.com/eyJidWNrZXQiOiJhcm9nZ2EiLCJrZXkiOiJtZWRpY2luZVwvMTJcLzEyNDc0LU5hcGEtNTAwLTUwMG1nLWJvYWMucG5nIiwiZWRpdHMiOnsicmVzaXplIjp7IndpZHRoIjoxMDAwLCJoZWlnaHQiOjEwMDAsImZpdCI6Im91dHNpZGUifSwib3ZlcmxheVdpdGgiOnsiYnVja2V0IjoiYXJvZ2dhIiwia2V5IjoibWlzY1wvd20ucG5nIiwiYWxwaGEiOjkwfX19",
    genericName: "Paracetamol",
    producePharma: "Beximco Pharmaceuticals Ltd.",
    isActive: false,
  ),
  Medicine(
    name: "Napa",
    mediType: "Suppository",
    image: "https://cdn1.arogga.com/eyJidWNrZXQiOiJhcm9nZ2EiLCJrZXkiOiJtZWRpY2luZVwvMTJcLzEyNDc0LU5hcGEtNTAwLTUwMG1nLWJvYWMucG5nIiwiZWRpdHMiOnsicmVzaXplIjp7IndpZHRoIjoxMDAwLCJoZWlnaHQiOjEwMDAsImZpdCI6Im91dHNpZGUifSwib3ZlcmxheVdpdGgiOnsiYnVja2V0IjoiYXJvZ2dhIiwia2V5IjoibWlzY1wvd20ucG5nIiwiYWxwaGEiOjkwfX19",
    genericName: "Paracetamol",
    producePharma: "Beximco Pharmaceuticals Ltd.",
    isActive: false,
  ),
  Medicine(
    name: "Napa",
    mediType: "Tablet",
    image: "https://cdn1.arogga.com/eyJidWNrZXQiOiJhcm9nZ2EiLCJrZXkiOiJtZWRpY2luZVwvMTJcLzEyNDc0LU5hcGEtNTAwLTUwMG1nLWJvYWMucG5nIiwiZWRpdHMiOnsicmVzaXplIjp7IndpZHRoIjoxMDAwLCJoZWlnaHQiOjEwMDAsImZpdCI6Im91dHNpZGUifSwib3ZlcmxheVdpdGgiOnsiYnVja2V0IjoiYXJvZ2dhIiwia2V5IjoibWlzY1wvd20ucG5nIiwiYWxwaGEiOjkwfX19",
    genericName: "Paracetamol",
    producePharma: "Beximco Pharmaceuticals Ltd.",
    isActive: false,
  ),
];