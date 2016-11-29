using Movies.BLL.Models;
using System.Collections.Generic;

namespace TodoApi.Models
{
    public interface IMovieRepository
    {
        //This interface defines basic CRUD operations.
        Movie Add(Movie item);
        IEnumerable<Movie> GetAll();
        Movie Find(int id);
        bool Remove(int id);
        bool Update(Movie item);
    }
}