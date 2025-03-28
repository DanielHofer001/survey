<?php

$servername = "localhost";
$username = "root";
$password = "";

// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
   die("Connection failed: " .  $conn->connect_error);
}

foreach( $_SERVER as $key => $value ) { 
    if($key === 'SERVER_SIGNATURE'){
        echo 'SERVER["' . $key.'"] = ';
        echo  $value . '<br/>'; 
    }
} 
echo "Connected to db successfully <br>";

$sql = "USE survey_db;";

$conn->query($sql) or die($conn->error);


function getDataFromTable($table, $filter=1): mysqli_result{
    global $conn;
    $result = $conn->query( "SELECT * FROM $table where $filter;") or die($conn->error);
    echo "(number of $table sets: " . $result->num_rows . ")<br/>";
    return $result;
}

function createAnswer($answer): bool {
    global $conn;

    // Prepare and execute the SQL query
    $stmt = $conn->prepare("INSERT INTO answers (survey_id, user_id, answer, question_id) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("iiss", $answer->survey_id, $answer->user_id, $answer->answer, $answer->question_id);

    return $stmt->execute() ? true : false;
}

?>