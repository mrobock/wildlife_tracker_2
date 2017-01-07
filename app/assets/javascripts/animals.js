$(document).ready(function() {
  $("#add_new_animal").on("click", function() {
    var newAnimal = {
      "animal": {
        "name": $("#animal_name").val(),
        "latin_name": $("#animal_latin_name").val(),
        "kingdom": $("#animal_kingdom").val()
      }
    };

    $.ajax({
      dataType: 'json',
      url: '/animals',
      method: 'POST',
      data: newAnimal,
      success: function(data) {
        var head = ["name", "latin_name", "kingdom"];
        
        $("#animal_tbody").append("<tr id='animal_list'></tr>");
        for (var i = 0; i < head.length; i++) {
          $("#animal_list").append("<td>" + data[head[i]] + "</td>");
        };

        $("#animal_list").append(
          "<td><a href='/animals/" + data.id + "'>Show</a></td>"
        );
      },
      error: function(jqXHR, testStatus, errorThrown) {
        alert("Whatever you want and the error thrown " + errorThrown);
      }
    });

  });
});
