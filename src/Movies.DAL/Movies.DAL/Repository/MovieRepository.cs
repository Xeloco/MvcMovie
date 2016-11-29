using System;
using System.Collections.Generic;
using Movies.BLL.Models;
using Movies.DAL.Data;

namespace TodoApi.Models
{
    public class MovieRepository : IMovieRepository
    {
        private static ApplicationDbContext _context;
        public List<Movie> movies = new List<Movie>();
        private int _nextId = 1;



        public MovieRepository()
        {
        }

        public MovieRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public IEnumerable<Movie> GetAll()//Ler todos os valores
        {
            return _context.Movie;
        }



        public Movie Find(int id)
        {

            return movies.Find(p => p.ID == id);
        }


        public void Update(Movie item)//atualizar um registo
        {
            movies[item.ID] = item;
        }

        public Movie Add(Movie item)
        {
            if (item == null)
            {
                throw new ArgumentNullException("item");

            }

            item.ID = _nextId++;
            movies.Add(item);
            return item;
        }


        bool IMovieRepository.Update(Movie item)
        {
            if (item == null)
            {
                throw new ArgumentNullException("item");
            }
            int index = movies.FindIndex(p => p.ID == item.ID);
            if (index == -1)
            {
                return false;
            }
            movies.RemoveAt(index);
            movies.Add(item);
            return true;
        }

        bool IMovieRepository.Remove(int id)
        {

            int index = movies.FindIndex(p => p.ID == id);
            movies.RemoveAt(index);
            return true;
        }
    }
}