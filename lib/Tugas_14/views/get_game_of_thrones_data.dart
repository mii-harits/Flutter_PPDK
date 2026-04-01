import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ppkd/Tugas_14/api/get_data.dart';

class GetGameOfThronesData extends StatefulWidget {
  const GetGameOfThronesData({super.key});

  @override
  State<GetGameOfThronesData> createState() => _GetGameOfThronesDataState();
}

class _GetGameOfThronesDataState extends State<GetGameOfThronesData> {
  List allUsers = [];
  List filteredUsers = [];
  TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  bool isLoading = false; // 🔥 tambahan

  @override
  void initState() {
    super.initState();
    loadData();
  }

  // 🔄 LOAD DATA (WITH ANIMATION)
  Future<void> loadData() async {
    setState(() => isLoading = true);

    await Future.delayed(const Duration(milliseconds: 500)); // efek smooth

    final data = await getUser();

    setState(() {
      allUsers = data;
      filteredUsers = allUsers;
      isLoading = false;
    });

    searchUser(searchController.text);
  }

  // 🔍 SEARCH
  void searchUser(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 400), () {
      final q = query.toLowerCase();

      if (q.isEmpty) {
        setState(() => filteredUsers = allUsers);
        return;
      }

      final results = allUsers.where((user) {
        final name = "${user.firstName ?? ""} ${user.lastName ?? ""}"
            .toLowerCase();
        final title = (user.title ?? "").toLowerCase();

        return name.contains(q) ||
            title.contains(q) ||
            name.replaceAll(" ", "").contains(q);
      }).toList();

      setState(() => filteredUsers = results);
    });
  }

  // 🔥 POPUP DETAIL
  void showCharacterDetail(dynamic item) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 15),

              // 🖼️ IMAGE
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    Image.network(
                      item.imageUrl ?? item.image ?? "",
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      filterQuality: FilterQuality.high,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.95),
                            Colors.black.withOpacity(0.4),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 15,
                      right: 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.fullName ??
                                "${item.firstName ?? ""} ${item.lastName ?? ""}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            item.title ?? "-",
                            style: TextStyle(color: Colors.grey[300]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    buildRow("First Name", item.firstName),
                    buildRow("Last Name", item.lastName),
                    buildRow("House", item.family),
                    buildRow("Title", item.title),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[400])),
          Text(
            value ?? "-",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // 🔥 SKELETON LOADING
  Widget buildSkeleton() {
    return ListView.builder(
      key: const ValueKey("loading"),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.whatshot, color: Colors.white, size: 20),
            SizedBox(width: 8),
            Text(
              "GAME OF THRONES",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 🔍 SEARCH
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {});
                searchUser(value);
              },
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search character...",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          searchController.clear();
                          searchUser("");
                          setState(() {});
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // 📜 LIST + ANIMATION
          Expanded(
            child: RefreshIndicator(
              onRefresh: loadData,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: isLoading
                    ? buildSkeleton()
                    : filteredUsers.isEmpty
                    ? ListView(
                        key: const ValueKey("empty"),
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: const [
                          SizedBox(height: 180),
                          Column(
                            children: [
                              Icon(
                                Icons.search_off,
                                color: Colors.grey,
                                size: 50,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "No Character Found",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Try another name or title of the character",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      )
                    : ListView.builder(
                        key: const ValueKey("data"),
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: filteredUsers.length,
                        itemBuilder: (context, index) {
                          final item = filteredUsers[index];

                          return GestureDetector(
                            onTap: () => showCharacterDetail(item),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        item.imageUrl ?? "",
                                        height: 180,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        alignment: Alignment.topCenter,
                                      ),
                                      Container(
                                        height: 180,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.black.withOpacity(0.9),
                                              Colors.transparent,
                                            ],
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 15,
                                        left: 15,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${item.firstName ?? ""} ${item.lastName == "None" ? "" : item.lastName ?? ""}",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              item.title ?? "",
                                              style: TextStyle(
                                                color: Colors.grey[300],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
