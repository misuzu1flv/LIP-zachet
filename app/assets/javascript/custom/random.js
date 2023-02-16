$(document).ready(function() {
  $('#add-questions-button').click(function(event){
    insertQuestion();
    event.preventDefault(); 
  });
});


function insertQuestion() {
  let questionsDiv = document.getElementById("questions-div");
  let questionDivs = document.getElementsByClassName("question-div");
  let questionDiv = questionDivs[0];
  let newQuestionDiv = questionDiv.cloneNode(true)
  questionsDiv.append(newQuestionDiv);
}

function submitTestFunction(){
let title = document.getElementById('test-title')
let desc = document.getElementById('test-desc')
let questions = document.getElementsByClassName('input is-primary test-questions');
let answers = document.getElementsByClassName('input is-primary test-answers');
let questionsArray = [];
let answersArray = [];
for (const element of questions) {
questionsArray.push(element.value);
};
for (const element of answers) {
answersArray.push(element.value);
};
let queryDict = {}
location.search.substr(1).split("&").forEach(function(item) {queryDict[item.split("=")[0]] = item.split("=")[1]})
    var params = { title: title.value, desc: desc.value, questions: questionsArray, answers: answersArray, locale: queryDict['locale'] }; 
    $.get('submit_test', params);
};

$(document).ready(function() {
  $('#submit-test-button').click(function(event){
    submitTestFunction();
    event.preventDefault(); 
  });
});


