<?php 
include 'db.php';

$result = getDataFromTable("survey_set");


echo "<h2> Survey sets </h2>";
if ($result-> num_rows > 0) {
  // output data of each row
  while($row = $result -> fetch_assoc()) {
    echo "ID: " . $row["id"] . 
    " - Title: " . $row["title"] . 
    " - Description: " . $row["description"] . 
    " - Start Date: " . $row["start_date"] . 
    " - End Date: " . $row["end_date"] . 
    " - Date Created: " . $row["date_created"]  . 
    " - <a href='form.php?survey=" . $row["id"] . "'>View Survey</a><br/><br/>";
 }
} else {
  echo "0 results";
}

echo "<br/><a href='answers.php'>Answers</a>";


?>