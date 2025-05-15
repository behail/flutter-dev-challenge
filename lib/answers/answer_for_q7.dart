/*
Question:  
Fetch a list of articles from a public REST API (e.g.,
https://jsonplaceholder.typicode.com/posts) and display them in a ListView.
a. Fetch a list of articles from a public REST API (e.g.,
https://jsonplaceholder.typicode.com/posts) and display them in a ListView.
b. Use
*/
//Solution:
import '../widgets.dart';

class AnswerForQ7 extends StatefulWidget {
  const AnswerForQ7({super.key});

  @override
  State<AnswerForQ7> createState() => _AnswerForQ7State();
}

const CATCHED_ARTICLES_KEY = 'catched_articles';
const API_URL = 'https://jsonplaceholder.typicode.com/posts';

class _AnswerForQ7State extends State<AnswerForQ7> {
  late Future<List<dynamic>> _futureArticles;

  @override
  void initState() {
    super.initState();
    _futureArticles = _loadAndFetchArticles();
  }

  Future<List<dynamic>> loadCache() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString(CATCHED_ARTICLES_KEY);

    if (cachedData != null) {
      return json.decode(cachedData);
    }
    return [];
  }

  Future<List<dynamic>> fetchArticles() async {
    final dio = Dio();

    final response = await dio.get(API_URL);

    if (response.statusCode == 200) {
      final List<dynamic> articles = response.data;

      final prefs = await SharedPreferences.getInstance();
      prefs.setString(CATCHED_ARTICLES_KEY, json.encode(articles));

      return articles;
    } else {
      throw Exception('Failed to fetch articles');
    }
  }

  Future<List<dynamic>> _loadAndFetchArticles() async {
    List<dynamic> cached = await loadCache();
    try {
      return await fetchArticles();
    } catch (_) {
      return cached;
    }
  }

  Future<void> _refreshArticles() async {
    setState(() {
      _futureArticles = _loadAndFetchArticles();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: FutureBuilder<List<dynamic>>(
            future: _futureArticles,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No items found'));
              } else {
                final articles = snapshot.data!;

                return RefreshIndicator(
                  onRefresh: _refreshArticles,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return _buildArticleCard(articles[index]);
                    },
                  ),
                );
              }
            }),
      ),
    );
  }

  Widget _buildArticleCard(Map<String, dynamic> article) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article['title'],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              article['body'],
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
