using System;
using System.ComponentModel.DataAnnotations;

namespace Movies.BLL.Models
{
    public class Movie
    {
        public int ID { get; set; }

        [StringLength(60, MinimumLength = 3)]//maximo e minimo de tamanho
        public string Title { get; set; }

        [Display(Name = "Release Date")]// nome que vai aparcer
        [DataType(DataType.Date)]// typo de dados
        public DateTime ReleaseDate { get; set; }

        [RegularExpression(@"^[A-Z]+[a-zA-Z''-'\s]*$")]//caracteres que podem ser usados
        [Required]// não pode estar em branco
        [StringLength(30)]
        public string Genre { get; set; }

        [Range(1, 100)]// de quanto a quanto
        [DataType(DataType.Currency)]
        public int Price { get; set; }

        [RegularExpression(@"^[A-Z]+[a-zA-Z''-'\s]*$")]
        [StringLength(5)]
        public string Rating { get; set; }
    }
}
