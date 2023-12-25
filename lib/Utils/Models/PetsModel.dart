class Pets {
  late String id;
  late String petName;
  late String imageUrl;
  late String ownerName;
  late DateTime appointmentDate;
  late DateTime appointmentTime;
  late String doctorName;
  late String clinicName;
  late String reasonForVisit;
  late String additionalNotes;
  late bool isConfirmed;
  late String petBreed;
  late int petAge;
  late String petGender;
  late String petDOB;
// create bool for vaccinated , spayed/neutered, and friendly with dogs, friendly with cats, friendly with kids, microchipped, purebred
  late bool isVaccinated;
  late bool isSpayed;
  late bool isFriendlyWithDogs;
  late bool isFriendlyWithCats;
  late bool isFriendlyWithKids;
  late bool isMicrochipped;
  late bool isPurebred;

  Pets({
    required this.petName,
    required this.imageUrl,
    required this.petBreed,
    required this.petAge,
  });

  // create a list of pets which can access from anywhere
  List<Pets> pets = [
    Pets(
      petName: 'Buddy ',
      imageUrl: 'assets/images/onboarding1.png',
      petBreed: 'Golden Retirver',
      petAge: 2,
    ),
    Pets(
      petName: 'Lucky',
      imageUrl: 'assets/images/onboarding2.png',
      petBreed: 'Labrador',
      petAge: 1,
    ),
    Pets(
      petName: 'Daisy',
      imageUrl: 'assets/images/onboarding3.png',
      petBreed: 'Pug',
      petAge: 3,
    ),
    Pets(
      petName: 'Bella',
      imageUrl: 'assets/images/onboarding4.png',
      petBreed: 'Poodle',
      petAge: 4,
    ),
    Pets(
      petName: 'Charlie',
      imageUrl: 'assets/images/onboarding5.png',
      petBreed: 'Bulldog',
      petAge: 5,
    ),
    Pets(
      petName: 'Max',
      imageUrl: 'assets/images/onboarding6.png',
      petBreed: 'Beagle',
      petAge: 6,
    ),
    Pets(
      petName: 'Molly',
      imageUrl: 'assets/images/onboarding7.png',
      petBreed: 'Pomeranian',
      petAge: 7,
    ),
    Pets(
      petName: 'Lucy',
      imageUrl: 'assets/images/onboarding8.png',
      petBreed: 'Chihuahua',
      petAge: 8,
    ),
    Pets(
      petName: 'Duke',
      imageUrl: 'assets/images/onboarding9.png',
      petBreed: 'Rottweiler',
      petAge: 9,
    ),
    Pets(
      petName: 'Rocky',
      imageUrl: 'assets/images/onboarding10.png',
      petBreed: 'German Shepherd',
      petAge: 10,
    ),
  ];
}
