$(document).ready -> 
  $('.form_datetime').datetimepicker({
    autoclose: true,
    todayBtn: true,
    pickerPosition: "bottom-left",
    format: 'yyyy-mm-dd hh:ii'
  });


  $('#calendar').fullCalendar
    editable: true,
    header:
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    defaultView: 'month',
    height: 500,
    slotMinutes: 30,

    eventSources: [{
      url: '/events.json',
    }],

    dragOpacity: "0.5"

    eventDrop: (event, dayDelta, minuteDelta, allDay, revertFunc) ->
      updateEvent(event);

    eventResize: (event, dayDelta, minuteDelta, revertFunc) ->
      updateEvent(event);


updateEvent = (the_event) ->
  $.update "/events/" + the_event.id,
    event:
      title: the_event.title,
      starts_at: "" + the_event.start,
      ends_at: "" + the_event.end,
      description: the_event.description

enforceModalFocusFn = $.fn.modal.Constructor::enforceFocus

$.fn.modal.Constructor::enforceFocus = ->

try
  $confModal.on "hidden", ->
    $.fn.modal.Constructor::enforceFocus = enforceModalFocusFn
    return
  $confModal.modal backdrop: false
catch error
  if error.name != 'ReferenceError'
    throw error
