<?php
include 'db.php';
include 'answer.php';

$survey_id = isset($_POST['survey']) ? $_POST["survey"] : '0';

echo "<h2> Thanks for your input to survey $survey_id </h2>";
$questions = _getDataFromTable("questions", "survey_id=$survey_id");
while ($question = $questions->fetch_assoc()) {
    echo "<h3> Question: ID (" . $question["id"] . ") " . $question["question"] . "</h3>";
    $answer = isset($_POST[$question["id"]]) ? $_POST[$question["id"]] : 'no answer';
    echo $answer . "<br/>";
    $answer = new Answer(survey_id: $survey_id, user_id: 123, answer: $answer, question_id: $question["id"]);
    _createAnswer($answer);

}
echo "<br/><a href='overview.php'>Overview</a>";

?>