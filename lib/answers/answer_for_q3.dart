//Question: Fetch data from a REST API and display it in a ListView.
//Solution:

import '../widgets.dart';

class AnswerForQ3 extends StatefulWidget {
  const AnswerForQ3({super.key});

  @override
  State<AnswerForQ3> createState() => _AnswerForQ3State();
}

class _AnswerForQ3State extends State<AnswerForQ3> {
  late Future<List<Item>> items;

  Future<List<Item>> fetchItems() async {
    // Simulate network delay (e.g. 2 seconds)
    await Future.delayed(const Duration(seconds: 2));

    // Load JSON string from local file
    final String jsonString =
        await rootBundle.loadString('assets/data/data.json');
    final List<dynamic> jsonList = json.decode(jsonString);

    // Simulate a Dio response with mock data
    final response = Response(
      data: jsonList,
      statusCode: 200,
      requestOptions: RequestOptions(path: 'mock'),
    );

    if (response.statusCode == 200) {
      return (response.data as List)
          .map((json) => Item.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    items = fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          body: FutureBuilder<List<Item>>(
              future: items,
              builder:
                  (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No items found'));
                } else {
                  return listViewBuilderView(snapshot);
                }
              }),
        ));
  }

  ListView listViewBuilderView(AsyncSnapshot<List<Item>> snapshot) {
    return ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          final item = snapshot.data![index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: Text(
                  item.id.toString(),
                  style: TextStyle(color: Colors.blue.shade800),
                ),
              ),
              title: Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text('ID: ${item.id}'),
              trailing: const Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.grey),
              onTap: () {
                //Add interaction
              },
            ),
          );
        });
  }
}

class Item {
  final int id;
  final String title;

  Item({required this.id, required this.title});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      title: json['title'],
    );
  }
}
