import 'package:flutter/material.dart';
import '../domain /bottle_model.dart';

class BottleDetailScreen extends StatefulWidget {
  final Bottle bottle;
  BottleDetailScreen({required this.bottle});

  @override
  _BottleDetailScreenState createState() => _BottleDetailScreenState();
}

class _BottleDetailScreenState extends State<BottleDetailScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black54,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'Genesis Collection',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white, size: 25),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Fixed background image in the stack
          Positioned.fill(
            child: Image.asset(
              'assets/images/wave.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff0B1519),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/genuineIcon.png',
                            height: 30,
                            width: 30,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Genuine Bottle ()',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.amber,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Bottle Image
                Center(
                  child: Image.asset(
                    widget.bottle.image,
                    height: 300,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 10),

                // Bottle Information
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff122329),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Text(
                            'Bottle ${widget.bottle.quantity}',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 5),
                          RichText(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: "EB Garamond",
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              children: [
                                TextSpan(
                                  text: "${widget.bottle.name} ",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: "${widget.bottle.age} Old",
                                  style: TextStyle(
                                    color: Colors.amber,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(
                            '#${widget.bottle.caskNumber}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          // Tab buttons: Details, Tasting notes, History
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: _buildTabButton('Details', 0)),
                                Expanded(child: _buildTabButton('Tasting notes', 1)),
                                Expanded(child: _buildTabButton('History', 2)),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          // Display the selected tab's content
                          _selectedTabIndex == 0
                              ? _buildDetailsSection()
                              : _selectedTabIndex == 1
                              ? _buildTastingNotesSection()
                              : _buildHistorySection(),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Center(
                    child: Container(
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Add to my collection',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Method to build the tab buttons
  Widget _buildTabButton(String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: _selectedTabIndex == index
              ? Colors.amber
              : Colors.black54,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: _selectedTabIndex == index
                  ? Colors.black
                  : Colors.white.withOpacity(0.7),
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  // Method to display the details section
  Widget _buildDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow('Distillery', widget.bottle.distillery),
        _buildDetailRow('Region', widget.bottle.region),
        _buildDetailRow('Country', widget.bottle.country),
        _buildDetailRow('Type', widget.bottle.type),
        _buildDetailRow('Age Statement', widget.bottle.age),
        _buildDetailRow('Filled', widget.bottle.filled),
        _buildDetailRow('Bottled', widget.bottle.bottled),
        _buildDetailRow('Cask Number', widget.bottle.caskNumber),
        _buildDetailRow('ABV', widget.bottle.abv),
        _buildDetailRow('Size', widget.bottle.size),
        _buildDetailRow('Finish', widget.bottle.finish),
      ],
    );
  }

  // Method to display a row of details
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  // Method to display the Tasting Notes Section
  Widget _buildTastingNotesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tasting notes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'by Charles MacLean MBE',
          style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 16),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 50,
                ),
                onPressed: () {
                  // Play video logic here
                },
              ),
            ),
          ),
        ),
        _buildTastingDescription('Nose', widget.bottle.tastingNotes['nose']!),
        _buildTastingDescription('Palate', widget.bottle.tastingNotes['palate']!),
        _buildTastingDescription('Finish', widget.bottle.tastingNotes['finish']!),
      ],
    );
  }

  // Placeholder for Tasting Notes Section
  Widget _buildTastingDescription(String section, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff1E2A2E),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              section,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              description,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // History Section
  Widget _buildHistorySection() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff1E2A2E),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(16),
      child: Column(

        children: [

          // Dynamically display history items
          ...widget.bottle.history.map((historyItem) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Row(
                children: [
                  // Vertical line and circle indicator
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                      ),
                      Container(
                        width: 1,
                        height: 30,
                        color: Colors.amber,
                      ),
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.amber,
                      ),

                      Container(
                        width: 1,
                        height: 10,
                        color: Colors.amber,
                      ),
                      dimondShapeContainer(),
                      Container(
                        width: 1,
                        height: 10,
                        color: Colors.amber,
                      ),
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.amber,
                      ),
                      Container(
                        width: 1,
                        height: 140,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                  SizedBox(width: 15), // Space between line and content
                  // Content (Title, Description, Attachments)
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff1E2A2E),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Label (Title)
                        Text(
                          historyItem['event']!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        // Title
                        Text(
                          historyItem['date']!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        // Description
                        SizedBox(height: 5),
                        Text(
                          historyItem['details']!,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text("Attachments:",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          )
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _buildAttachmentBox(),
                            SizedBox(width: 10),
                            _buildAttachmentBox(),
                            SizedBox(width: 10),
                            _buildAttachmentBox(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildAttachmentBox() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey, // Placeholder color for attachments
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget dimondShapeContainer() {
    return Transform.rotate(
      angle: 45 * 3.14159 / 180, // Rotate 45 degrees in radians
      child: Container(
        width: 10, // Width of the square
        height: 10, // Height of the square
        decoration: BoxDecoration(
          color: Colors.amber, // Color of the diamond
        ),
      ),
    );
  }
}
