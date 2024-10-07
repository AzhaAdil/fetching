import 'package:fetching/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Photos.dart';
import 'PostDetailScreen.dart';
import 'Repo.dart';
import 'bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => PhotoBloc(PhotoRepository())..add(FetchPhotos()),
        child: PhotoPage(),
      ),
    );
  }
}

class PhotoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Photos')),
      body: BlocBuilder<PhotoBloc, PhotoState>(
        builder: ( context, state) {
          if (state is PhotoInitial) {
            return Center(child: Text('Press button to fetch photos.'));
          } else if (state is PhotoLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PhotoLoaded) {
            return Column(
              children:[
                Expanded(
              child: ListView.builder (
                itemCount: state.photos.length,
                itemBuilder: (context, index) {
                  final photo = state.photos[index];
                  return   Card(
                    child:ListTile (

                        leading:Image.network(photo.thumbnailUrl),
                      
                      trailing:IconButton(onPressed: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>PostDetailScreen(post: photo, ),
                          ),
                        );
                      }, icon: Icon(Icons.add)),

                    )
                  );
                },
              ),
              ),
          ]
         );
          } else if (state is PhotoError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Container();
        },
      ),
    );
  }
}
