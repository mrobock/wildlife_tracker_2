$(document).ready(function() {
   $("#calendar").fullCalendar({
     events: "/sightings/get_events",
     timeFormat: "LT",
     defaultView: 'month',
     header: {
       right: 'prev,next today',
       center: 'title',
       left: 'month,agendaWeek,agendaDay'
     },
     eventClick: function(event) {
       if (event.url) {
         window.open(event.url);
         return false;
       }
     }
  });

  $("#animal_calendar").fullCalendar({
    events: "/animals/"+ $("#animal_id").val() + "/specific_get_events",
    timeFormat: "LT",
    defaultView: 'month',
    header: {
      right: 'prev,next today',
      center: 'title',
      left: 'month,agendaWeek,agendaDay'
    },
    eventClick: function(event) {
      if (event.url) {
        window.open(event.url);
        return false;
      }
    }
 });
});
//
// $(document).ready(function() {
//    $("#calendar").fullCalendar({
//      events: [
//         {
//           title: 'Concert #1',
//           start: '2016-06-01',
//           allDay: true
//         }
//       ]
//   });
// });
