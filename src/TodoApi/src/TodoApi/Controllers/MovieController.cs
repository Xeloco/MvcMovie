using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using TodoApi.Models;
using System.Linq;
using Movies.BLL.Models;
using Movies.DAL.Data;
using System.Web.Http;

namespace TodoApi.Controllers
{


    
    [Route("api/[controller]")]
    public class MovieController : ApiController
    {
        public List<Movie> movies = new List<Movie>();
        private readonly ApplicationDbContext _context;
        static readonly IMovieRepository repository = new MovieRepository();


        public MovieController(ApplicationDbContext context)
        {
            _context = context;
        }
        public IMovieRepository Movie { get; set; }


        [HttpGet]
        public IEnumerable<Movie> GetAll()
        {

            return _context.Movie;
        }


          [HttpGet("{id}", Name = "GetMovie")]
          public IActionResult GetByid(int id)
          {

            var result = from m in _context.Movie
                         select m;

            result = result.Where(s => s.ID == id);

                if (result==null)
            {
                return NotFound();
            }
            return new ObjectResult(result);
          }

        [HttpPut("{id}")]
        public void PutMovie(int id, [FromBody] Movie movie)
        {
            _context.Movie.Update(movie);
            _context.SaveChanges();
        }

        [HttpPost]
        public void PostProduct([FromBody] Movie item)
        {
           
            _context.Movie.Add(item);
            _context.SaveChanges();


        }

       

          [HttpDelete("{id}")]
          public void Delete(int id)
          {


            var movie =  _context.Movie.SingleOrDefault(m => m.ID == id);

            Movie moviToRemove = movie ;

            _context.Movie.Remove(moviToRemove);
            _context.SaveChanges();

            
          }
          

    }


}
