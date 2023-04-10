import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<Map<String, dynamic>> _allUsers = [
    {
      "image": "const AssetImage('lib/images/flutter.png')",
      "id": 1,
      "name": "krishna",
      "des": "TCE collage",
    },
    {
      "id": 2,
      "name": "Tony stark",
      "des": "Stark Inderstry ",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/4/47/Iron_Man_%28circa_2018%29.png",
    },
    {
      "id": 3,
      "name": "Ram",
      "des": "CIT collage",
      "image": "",
    },
    {
      "id": 4,
      "name": "Raj",
      "des": "Tce collage ",
      "image": "",
    },
    {
      "id": 5,
      "name": "kanish",
      "des": "PSG collage",
      "image": "",
    },
    {
      "id": 6,
      "name": "Ajay",
      "des": "TCE collage",
      "image": "",
    },
    {
      "id": 7,
      "name": "Kishor",
      "des": "TCE collage",
      "image": "",
    },
    {
      "id": 8,
      "name": "Ranjith",
      "des": "CIT ",
      "image": "",
    },
    {
      "id": 9,
      "name": "Nithish",
      "des": "Tce",
      "image": "",
    },
    {
      "id": 10,
      "name": "Becky",
      "des": "MIT ",
      "image": "",
    },
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('User List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                hintText: "Search",
                suffixIcon: const Icon(Icons.search),
                // prefix: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                        elevation: 1,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 20,
                              )
                            ],
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30.0,
                              backgroundImage:
                                  NetworkImage(_foundUsers[index]['image']),
                              backgroundColor: Colors.transparent,
                            ),
                            title: Text(_foundUsers[index]['name']),
                            subtitle: Text('${_foundUsers[index]["des"]}'),
                          ),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found Please try with diffrent search',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
