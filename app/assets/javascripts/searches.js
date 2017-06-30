$(document).ready(function() {
  $( function() {
    var searchSource = [];
    var searchAPI = '/autocomplete.json';
    $.getJSON( searchAPI, {
      format: 'json'
    }).done(function(data) {
      $.each(data, function(_, single_record) {
        searchSource.push(single_record.name);
      });
    });
    $('#story-search').autocomplete({
      source: function(req, response) {
        var results = $.ui.autocomplete.filter(searchSource, req.term);
        response(results.slice(0, 5));
      }
    });
  });
});
