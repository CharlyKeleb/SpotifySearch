import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:spotify/components/albumns_card.dart';
import 'package:spotify/components/artists_row.dart';
import 'package:spotify/model/album_model.dart';
import 'package:spotify/model/artist_model.dart';
import 'package:spotify/services/auth_service.dart';
import 'package:spotify/view_model/search_view_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SearchViewModel viewModel = Provider.of<SearchViewModel>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30.0),
              const Text(
                'Search',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 15.0),
              Card(
                child: Container(
                  height: 60.0,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        const Icon(IconlyLight.search, size: 27.0),
                        const SizedBox(width: 10.0),
                        Flexible(
                          child: TextField(
                            decoration: const InputDecoration.collapsed(
                              hintText: 'Artists, albums...',
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onChanged: (val) {
                              viewModel.setQuery(val);
                              viewModel.search();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  for (String type in viewModel.searchTypes)
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () async {
                          await viewModel.setSearchOption(type);
                          viewModel.search();
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: viewModel.selectedType == type
                                  ? Theme.of(context).colorScheme.secondary
                                  : Colors.grey.withOpacity(0.9),
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            color: viewModel.selectedType == type
                                ? Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.65)
                                : null,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                type,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20.0),
              // conditional Views - show album view
              Expanded(
                child: viewModel.selectedType == 'Album'
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 0.6,
                        ),
                        itemCount: viewModel.albums.albums?.items?.length ?? 0,
                        itemBuilder: (context, index) {
                          final AlbumItem? album =
                              viewModel.albums.albums?.items?[index];
                          return AlbumCard(
                            title: album?.name ?? "",
                            artist: album?.artists ?? [],
                            year: album?.releaseDate ?? "",
                            type: album?.type ?? "",
                            imgURL: (album?.images != null &&
                                    album!.images!.isNotEmpty)
                                ? album.images!.first.url!
                                : "",
                          );
                        },
                      )
                    //show artist view
                    : ListView.builder(
                        itemCount:
                            viewModel.artists.artists?.items?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          ArtistItems? artist =
                              viewModel.artists.artists?.items?[index];
                          return ArtistRow(
                            title: artist?.name ?? "",
                            imgURL: (artist?.images != null &&
                                    artist!.images!.isNotEmpty)
                                ? artist.images!.first.url!
                                : "",
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
