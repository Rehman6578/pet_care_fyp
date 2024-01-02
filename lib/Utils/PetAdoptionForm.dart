// class AddAdoptionForm extends StatefulWidget {
//   @override
//   _AddAdoptionFormState createState() => _AddAdoptionFormState();
// }
//
// class _AddAdoptionFormState extends State<AddAdoptionForm> {
//   // Define TextEditingControllers for each field
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _breedController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();
//   final TextEditingController _genderController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _imageUrlController = TextEditingController();
//
//   // Define variables for additional options (optional)
//   String _selectedSpecies = 'Dog';
//   bool _housetrained = false;
//   bool _goodWithChildren = false;
//   bool _goodWithOtherPets = false;
//
//   // Build the form
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Pet information
//             Text('Pet Details', style: Theme.of(context).textTheme.headline6),
//             const SizedBox(height: 16.0),
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             const SizedBox(height: 8.0),
//             DropdownButton<String>(
//               value: _selectedSpecies,
//               items: const [
//                 DropdownMenuItem(
//                   value: 'Dog',
//                   child: Text('Dog'),
//                 ),
//                 DropdownMenuItem(
//                   value: 'Cat',
//                   child: Text('Cat'),
//                 ),
//                 // ...other species
//               ],
//               onChanged: (value) => setState(() => _selectedSpecies = value!),
//             ),
//             const SizedBox(height: 8.0),
//             TextField(
//               controller: _breedController,
//               decoration: InputDecoration(labelText: 'Breed'),
//             ),
//             const SizedBox(height: 8.0),
//             TextField(
//               controller: _ageController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'Age (years)'),
//             ),
//             const SizedBox(height: 8.0),
//             TextField(
//               controller: _genderController,
//               decoration: InputDecoration(labelText: 'Gender'),
//             ),
//             const SizedBox(height: 8.0),
//             TextField(
//               controller: _descriptionController,
//               maxLines: 5,
//               decoration: InputDecoration(
//                 labelText: 'Description',
//                 hintText: 'Tell us about your pet and what they need!',
//               ),
//             ),
//             const SizedBox(height: 8.0),
//             TextField(
//               controller: _imageUrlController,
//               decoration: InputDecoration(labelText: 'Image URL (optional)'),
//             ),
//
//             // Additional options (optional)
//             const SizedBox(height: 16.0),
//             Text('Additional Information', style: Theme.of(context).textTheme.headline6),
//             const SizedBox(height: 8.0),
//             Row(
//               children: [
//                 Checkbox(
//                   value: _housetrained,
//                   onChanged: (value) => setState(() => _housetrained = value!),
//                 ),
//                 Text('Housetrained'),
//               ],
//             ),
//             const SizedBox(height: 8.0),
//             Row(
//               children: [
//                 Checkbox(
//                   value: _goodWithChildren,
//                   onChanged: (value) => setState(() => _goodWithChildren = value!),
//                 ),
//                 Text('Good with children'),
//               ],
//             ),
//             const SizedBox(height: 8.0),
//             Row(
//               children: [
//                 Checkbox(
//                   value: _goodWithOtherPets,
//                   onChanged: (value) => setState(() => _goodWithOtherPets = value!),
//                 ),
//                 Text('Good with other pets'),
//               ],
//             ),
//
//             // Submit button
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Add validation logic as needed
//                 // Submit pet information to your backend for processing
//               },
//               child: Text('Add pet for adoption'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
