<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 <h2>Movies</h2>

  
        <ul>
        <li><a id="verlista">All Data</a></li>
       <li><a id="criar">New Movie</a></li>
        <li><a id="apagar">Delete Movie</a></li>
        <li><a id="editar">Edit Movie</a></li>
        </ul>
    <br />
   
         <h4>Pesquisa</h4>    
        <input type="text" id="pesquisa" />
        <input type="button" id="search" value="Search" />
 
    <%-------------------------------------------------- LISTA RESULTADOS------------------------------------------------------------%>
    <div id="pg_list">
        <table class="table">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Genre</th>
                    <th>Price</th>
                    <th>Rating</th>
                    <th>ReleaseDate</th>
                </tr>
            </thead>
            <tbody id="body"></tbody>
        </table>
        <a id="close_list">Close List</a>
    </div>

    <%-------------------------------------------------- END LISTA RESULTADOS------------------------------------------------------------%>

    <%--------------------------------------------------   CREATE  ------------------------------------------------------------%>
    <div id="pg_create">
        <hr />
        <h3>Create</h3>

        <div class="form-horizontal">
            <hr />
            <div class="form-group">
                <label class="col-md-2 control-label">Title:</label>
                <div class="col-md-10">
                    <input id="cr_title" type="text" class="form-control" />
                    <span class="text-danger" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Genre:</label>
                <div class="col-md-10">
                    <input id="cr_genre" type="text" class="form-control" />
                    <span class="text-danger" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Price:</label>
                <div class="col-md-10">
                    <input id="cr_price" type="number" min="0" value="0" class="form-control" />
                    <span class="text-danger" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">ReleaseDate:</label>
                <div class="col-md-10">
                    <input id="cr_releasedate" type="datetime-local" class="form-control" />
                    <span class="text-danger" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Rating:</label>
                <div class="col-md-10">
                    <input id="cr_rating" type="text" class="form-control" />
                    <span class="text-danger" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <input id="bt_create" type="button" value="Create" class="btn btn-default" />
                </div>

            </div>
            <hr />
            <a id="create_cancel">Close</a>
        </div>
    </div>
    <%-------------------------------------------------- END CREATE------------------------------------------------------------%>

    <%-------------------------------------------------- EDIT ------------------------------------------------------------%>

     <div id="pg_edit">
        <hr />
        <h3>Edit</h3>

        <div class="form-horizontal">
            <hr />
            <div class="form-group">
                <label class="col-md-2 control-label">ID:</label>
                <div class="col-md-10">
                    <input id="edt_id" type="text" class="form-control" />
                    <span class="text-danger" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Title:</label>
                <div class="col-md-10">
                    <input id="edt_title" type="text" class="form-control" />
                    <span class="text-danger" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Genre:</label>
                <div class="col-md-10">
                    <input id="edt_genre" type="text" class="form-control" />
                    <span class="text-danger" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Price:</label>
                <div class="col-md-10">
                    <input id="edt_price" type="number" min="0" value="0" class="form-control" />
                    <span class="text-danger" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">ReleaseDate:</label>
                <div class="col-md-10">
                    <input id="edt_releasedate" type="datetime-local" class="form-control" />
                    <span class="text-danger" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 control-label">Rating:</label>
                <div class="col-md-10">
                    <input id="edt_rating" type="text" class="form-control" />
                    <span class="text-danger" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <input id="bt_edit" type="button" value="Create" class="btn btn-default" />
                </div>

            </div>
            <hr />
            <a id="edit_cancel">Close</a>
        </div>
    </div>


    <%------------------------------------------------------- END EDIT------------------------------------------------------------%>

    <%------------------------------------------------------- DELETE------------------------------------------------------------%>
    <div id="pg_delete">
        <hr />
        <h3>Delete</h3>

        <div class="form-horizontal">
            <hr />
            <div class="form-group">
                <label class="col-md-2 control-label">Insira o ID:</label>
                <div class="col-md-10">
                    <input id="dl_id" type="text" class="form-control" />
                    <span class="text-danger" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <input id="bt_delete" type="button" value="Delete" class="btn btn-default" />
                </div>

            </div>
        </div>
        <hr />
        <a id="delete_cancel">Close</a>
    </div>
   <%-------------------------------------------------- END DELETE------------------------------------------------------------%>

    <script src="scripts/jquery-1.10.2.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        function getall() {
            $.ajax({
                url: 'http://localhost:54184/api/Movie',
                dataType: 'json',
                contentType: 'json',
                type: 'GET', // this is default, but worth pointing out
                success: function (data) {
                    $('#body').empty(); // Clear the table body.

                    // Loop through the list of movies.
                    $.each(data, function (key, value) {
                        // Add a table row for the movies.
                        var dataJson = JSON.stringify(value);
                        var val = $.parseJSON(dataJson);

                        $('<tr><td>' + val.title + '</td><td>' + val.genre + '</td><td>' + val.price + '</td><td>' + val.rating + '</td><td>' + val.releaseDate + '</td><td><a id="del">Delete</a></td></tr>').appendTo($('#body'));
                    });
                }
            })
        }
        $(document).ready(function start() {
            getall();
            $("#pg_list").hide();
            $("#pg_create").hide();
            $("#pg_delete").hide();
            $("#pg_edit").hide();

        });

        $('#verlista').on('click', function () {
            getall();
            $('#pg_list').slideDown(1000);
        });

        $('#criar').on('click', function () {
            $('#pg_list').slideUp(1000);
            $('#pg_delete').slideUp(1000);
            $('#pg_edit').slideUp(1000);
            $('#pg_create').slideDown(1000);
        });

        $('#create_cancel').on('click', function () {
            $('#pg_create').slideUp(1000);
        });
        $('#delete_cancel').on('click', function () {
            $('#pg_delete').slideUp(1000);
        });

        $('#apagar').on('click', function () {
            $('#pg_list').slideUp(1000);
            $('#pg_create').slideUp(1000);
            $('#pg_edit').slideUp(1000);
            $('#pg_delete').slideDown(1000);
           
        });

        $('#close_list').on('click', function () {
            $('#pg_list').slideUp(1000);
        });

        $('#editar').on('click', function () {
            $('#pg_list').slideUp(1000);
            $('#pg_create').slideUp(1000);
            $('#pg_delete').slideUp(1000);
            $('#pg_edit').slideDown(1000);
        });

        $('#edit_cancel').on('click', function () {
            $('#pg_edit').slideUp(1000);
        });
       
        /*Procurar por titulo*/
        $('#search').on('click', function () {
            $.ajax({
                url: 'http://localhost:54184/api/Movie',
                dataType: 'json',
                contentType: 'json',
                type: 'GET',
                data: $("#pesquisa").val(),// this is default, but worth pointing out
                success: function (data) {
                    $('#body').empty(); // Clear the table body.

                    // Loop through the list of movies.
                    $.each(data, function (key, value) {
                        // Add a table row for the movies.
                        var dataJason = JSON.stringify(value);
                        var val = $.parseJSON(dataJason);


                        if (val.title === $("#pesquisa").val()) {
                            $('<tr><td>' + val.title + '</td><td>' + val.genre + '</td><td>' + val.price + '</td><td>' + val.rating + '</td><td>' + val.releaseDate + '</td><td><a id="del">Delete</a></td></tr>').appendTo($('#body'));
                        }
                    });

                    $('#body').slideDown(1000);
                }
            })
        });

                                                         /*Criar novo*/
        $("#bt_create").click(function () {

            var movie = { "title": $('#cr_title').val(), "releaseDate": $('#cr_releasedata').val(), "genre": $('#cr_genre').val(), "price": parseFloat($('#cr_price').val()), "rating": $('#cr_rating').val() };

            $.ajax({
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                },
                url: 'http://localhost:54184/api/Movie',
                type: 'POST',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(movie),
            }).done( function (data) {
                alert("Registo inserido com sucesso!");
            })
        });

                                                         /*Apagar*/
        $("#bt_delete").click(function () {

            $.ajax({
                url: 'http://localhost:54184/api/Movie/'+$('#dl_id').val(),
                type: 'DELETE',
                dataType: "json",
                contentType: "application/json"
            }).done(function (data) {
                alert("Registo excluido com sucesso!");
            })
        });
                                                            /*Editar*/
        $("#bt_edit").click(function () {

            var idmovie = parseInt($('#edt_id').val());
            var movie = { id: idmovie, title: $('#edt_title').val(), releaseDate: $('#edt_releasedate').val(), genre: $('#edt_genre').val(), price: parseFloat($('#edt_price').val()), rating: $('#edt_rating').val() };
            var jsonData = JSON.stringify(movie)

            $.ajax({
                url: 'http://localhost:54184/api/Movie/' + idmovie,
                type: 'PUT',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: jsonData
            }).done(function (data) {
                alert("Registo editado com sucesso!");
            })
        });
       
    </script>
</asp:Content>



