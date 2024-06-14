import 'package:flutter/material.dart';

// Dummy data untuk ulasan
List<Map<String, dynamic>> dummyReviews = [
  {
    'date': '12 Juni 2024',
    'userName': 'John Doe',
    'rating': 4.5,
    'reviewText': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
  },
  {
    'date': '15 Mei 2024',
    'userName': 'Jane Smith',
    'rating': 5.0,
    'reviewText': 'Ut enim ad minim veniam, quis nostrud exercitation ullamco...',
  },
  {
    'date': '12 Mei 2024',
    'userName': 'Jaden Smith',
    'rating': 4.0,
    'reviewText': 'Ut enim ad minim veniam, quis nostrud exercitation ullamco nansas sajnsans aklslkans asnaj eb eysba sahsa esajnsans eanskjansa bsahsb eijdindiown dandia bbadbabeabnwamw aiias',
  },
  // Tambahkan lebih banyak ulasan di sini jika diperlukan
];

class Ulasan extends StatelessWidget {
  const Ulasan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(245, 239, 230, 1),
        leading: IconButton(
          icon: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.black,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'ULASAN',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: dummyReviews.length,
              itemBuilder: (context, index) {
                return ReviewCard(
                  date: dummyReviews[index]['date'],
                  userName: dummyReviews[index]['userName'],
                  rating: dummyReviews[index]['rating'],
                  reviewText: dummyReviews[index]['reviewText'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String date;
  final String userName;
  final double rating;
  final String reviewText;

  const ReviewCard({
    required this.date,
    required this.userName,
    required this.rating,
    required this.reviewText,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 274),
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              userName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Color.fromRGBO(79, 111, 82, 1),
                  size: 20,
                ),
                Text(
                  rating.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(79, 111, 82, 1),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              reviewText,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
