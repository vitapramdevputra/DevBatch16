
Airplane p1 = new Passenger();
Airplane c1 = new cargo();
Airplane t1 = new Training();
List<airplane> l = new list<airplane>{p1, c1, t1};
for (airplane a : l) {
    a.takeOff();
}