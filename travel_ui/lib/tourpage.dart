import 'package:flutter/material.dart';
import 'package:travel_ui/models.dart';

class TourDetailPage extends StatefulWidget {
  final Detail tourDetail;
  final String imagepath;

  const TourDetailPage({
    super.key,
    required this.tourDetail,
    required this.imagepath,
  });

  @override
  _TourDetailPageState createState() => _TourDetailPageState();
}

class _TourDetailPageState extends State<TourDetailPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final days = widget.tourDetail.days;
    final countries = ['Tour Schedule', 'Accommodation', 'Booking Detail'];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
        flexibleSpace: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.tourDetail.countryName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Explore the beauty of ${widget.tourDetail.countryName}",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(countries.length, (index) {
                          final isSelected = index == selectedIndex;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                width: 130,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? const Color.fromARGB(255, 66, 66, 66)
                                      : const Color.fromARGB(
                                          255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    countries[index],
                                    style: TextStyle(
                                      color: isSelected
                                          ? const Color.fromARGB(
                                              255, 255, 255, 255)
                                          : const Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  for (int i = 0; i < days.length; i++)
                    ExpansionTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          widget.imagepath,
                          height: 120,
                          width: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Row(
                        children: [
                          Text(
                            'Day ${i + 1}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        days[i].title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600],
                        ),
                      ),
                      tilePadding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 25.0,
                      ),
                      childrenPadding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 30.0,
                      ),
                      backgroundColor: const Color.fromARGB(255, 240, 239, 239),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      trailing: const Icon(
                        Icons.arrow_drop_down_sharp,
                        size: 30,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16),
                              const Text(
                                'Morning',
                                style:
                                    TextStyle(fontSize: 26, color: Colors.grey),
                              ),
                              Text(
                                days[i].morning,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Afternoon',
                                style:
                                    TextStyle(fontSize: 26, color: Colors.grey),
                              ),
                              Text(
                                days[i].afternoon,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Evening',
                                style:
                                    TextStyle(fontSize: 26, color: Colors.grey),
                              ),
                              Text(
                                days[i].evening,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {},
                child: const Text(
                  "Book a Tour",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
