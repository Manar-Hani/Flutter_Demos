import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/model/movie.dart';
import 'movie_ui/movie_ui.dart';

class MovieListView extends StatelessWidget {

  final List<Movie> movieList = Movie.getMovies();

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Movies"),
            backgroundColor: Colors.blueGrey.shade900,
          ),
          backgroundColor: Colors.blueGrey.shade900,
          body: ListView.builder(
              itemCount: movieList.length,
              itemBuilder: (BuildContext context, int index){
                return Stack(
                    children:<Widget> [
                     movieCard(movieList[index], context),
                      Positioned(
                        top: 10.0,
                          child: movieImage(movieList[index].images[0]))
                    ]);
          }),
        );
      }

      Widget movieCard(Movie movie, BuildContext context){
        return InkWell(
          child: Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(left: 60.0),
            width: MediaQuery.of(context).size.width,
            height: 150.0,
            child: Card(
              color: Colors.black45,
              child: Padding(
                padding: const EdgeInsets.only(top:8.0,
                bottom: 8.0,
                left: 54.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                               children: <Widget>[
                                                Flexible(
                                                  child: Text(movie.title, style:
                                                    TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 17,
                                                      color: Colors.white
                                                    ),),
                                                ),
                                               Flexible(
                                                 child: Text("Rating: ${movie.imdbRating} /10",
                                                     style: mainTextStyle()),
                                               )
                                  ],
                                ),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                       children: <Widget>[
                                         Flexible(
                                          child: Text("Released: ${movie.released}",
                                           style: mainTextStyle()),
                                         ),
                                         Flexible(
                                         child:Text(movie.runtime,
                                           style: mainTextStyle()),
                                         ),
                                         Flexible(
                                           child:Text(movie.rated,
                                           style: mainTextStyle())
                                         )
                                  ],
                                ),
                            ],
                          ),
                        ),
              ),
            ),
          ),
          onTap: (){ Navigator.push(context, MaterialPageRoute(
                     builder: (context) => MovieListViewDetails(
                     movie: movie,)));
               },
        );
      }

      TextStyle mainTextStyle(){
        return TextStyle(
                fontSize: 15.0,
                color: Colors.grey
            );
      }

      Widget movieImage(String imageUrl){
        return Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(imageUrl ?? "https://image.freepik.com/free-vector/it-s-movie-time-print-concept-with-lettering-watching-cinema-with-popcorn-film-reel-movie-cracker-flat-hand-drawn-illustration_119217-1495.jpg"),
              fit: BoxFit.cover
            )
          ),
        );
      }
    }




    // New route ( screen two )
    class MovieListViewDetails extends StatelessWidget {

      final String movieName;
      final Movie movie;

  const MovieListViewDetails({Key key, this.movieName, this.movie}) : super(key: key);

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text ("Movie"),
            backgroundColor: Colors.blueGrey.shade900,
          ),
          body: ListView(
                  children: <Widget>[
                    MovieDetailsThumbnail(thumbnail: movie.images[0]),
                    MovieDetailsHeaderWithPoster(movie: movie),
                    HorizontalLine(),
                    MovieDetailsCast(movie: movie),
                    HorizontalLine(),
                    MovieDetailsExtraPosters(posters: movie.images,)

                  ],
          ),

        );
      }
    }

    


    
    
    

    
