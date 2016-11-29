using System.Collections.Generic;

namespace Movies.BLL.Models
{
    public class MovieGenreViewModel
    {
        public List<Movie> movies;
        public List<string> genres;
        public string movieGenre { get; set; }
    }
}
