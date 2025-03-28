<form action="survey.php" method="post">

    <?php 
    include 'db.php';
    
    $survey_id = isset($_GET['survey']) ? $_GET["survey"]: '0';
    echo "<h2> Survey $survey_id </h2>";
    
    $questions = getDataFromTable("questions", "survey_id=$survey_id");
    if ($questions-> num_rows > 0) {
        while ($question = $questions->fetch_assoc()) {
            $questionId = $question["id"];
           echo "ID: " . $question["id"] . 
            " - Question: " . $question["question"] . 
            " - Type: " . $question["type"] . 
            " - Survey ID: " . $question["survey_id"] . 
            " - Date Created: " . $question["date_created"] ."<br/><br/>";
            $options = getDataFromTable("options", "question_id=$questionId");
            while ($opt = $options->fetch_assoc()) {
                $val = $opt["value"];
                echo "<label><input type='radio' name='$questionId' value='$val'> " . $opt["value"] ." (". $opt["id"]. ")</label><br/>";
            }
        }
        echo "<input type='hidden' name='survey' value= '$survey_id'>";

    } else {
        echo "0 questions";
    }
    ?>
    <input type="submit" value="Absenden">
    <br/><a href='overview.php'>Overview</a>

</form>