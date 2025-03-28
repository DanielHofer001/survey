<?php 
include 'db.php';

$result = getDataFromTable("answers");


echo "<h2> Answers </h2>";
if ($result-> num_rows > 0) {
  // output data of each row
  while($row = $result -> fetch_assoc()) {
    echo "ID: " . $row["id"] .
    " - Survey ID: " . $row["survey_id"] .
    " - User ID: " . $row["user_id"] .
    " - Answer: " . $row["answer"] .
    " - Question ID: " . $row["question_id"] .
    " - Date Created: " . $row["date_created"] . "<br/>";

 }
} else {
  echo "0 results";
}
echo "<br/><a href='overview.php'>Overview</a>";

?>