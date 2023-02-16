//= require jquery3
//= require jquery_ujs
//= require_tree .

function test(){
let answers = document.getElementsByClassName('input is-primary');
let blablas = [];
for (const element of answers) {
blablas.push(element.value);
};
let queryDict = {}
location.search.substr(1).split("&").forEach(function(item) {queryDict[item.split("=")[0]] = item.split("=")[1]})
    var params = { values: blablas, locale: queryDict['locale'] }; 
    $.get('submit_results', params);
};

$(document).ready(function() {
  $('#greet-user-button').click(function(event){
    test();
    event.preventDefault(); 
  });
});

