import 'package:flutter/material.dart';

class AppointmentDone extends StatelessWidget {
  const AppointmentDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: 415,
        height: 850,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [Color(0xff4552cb), Color(0xff4596ea)],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 135.0),
              child: Container(
                height: 112,
                width: 112,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 0,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                    ),
                  ],
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/checks.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              'Your appointment\n has been booked',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Vasilenko Oksana will be waiting\n         for you and your pet',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                width: 213,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: const Color(0x99472ca4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/icon.png', height: 19, width: 19),
                    const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Text(
                        'Wed 9 Sep at 10:30 am',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '+ Add appointment to calendar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 93),

               ElevatedButton(
                onPressed: () {
                  // Add your button press logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, // Set the background color to transparent
                  padding: EdgeInsets.zero, // Remove padding to have full control over child widget
                ),
                child: Container(
                  height: 46,
                  width: 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: const LinearGradient(
                      colors: [Color(0xff4552cb), Color(0xff4596ea)],
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Icon(
                          Icons.access_time,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          'Wed 9 Sep at 10:30 am',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )


          ],
        ),
      ),
    );
  }
}
