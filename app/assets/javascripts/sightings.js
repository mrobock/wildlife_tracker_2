$(document).ready(function() {
  $("#add_new_sighting").on("click", function() {
    var newSighting = {
      "Sighting": {
        "date": $("#sighting_date").val(),
        "time": $("#sighting_time").val(),
        "latitude": $("#sighting_latitude").val(),
        "longitude": $("#sighting_longitude").val(),
        "animal_id": $("#animal_id").val()
      }
    };

    $.ajax({
      dataType: 'json',
      url: '/sightings',
      method: 'POST',
      data: newSighting,
      success: function(data) {
        //Do Something later
        alert("Success!");
        $("#sighting_list").append("<tr><td>"+data.date+"</td><td>"+data.time+"</td><td>"+data.latitude+"</td><td>"+data.longitude+"</td><td>"+data.animal_id+"</td></tr>")
      },
      error: function(jqXHR, testStatus, errorThrown) {
        alert("Whatever you want and the error thrown " + errorThrown);
      }
    });

  });
});
