<?php
class Answer {
    public $survey_id;
    public $user_id;
    public $answer;
    public $question_id;

    // Constructor to initialize the properties
    public function __construct($survey_id, $user_id, $answer, $question_id) {
        $this->survey_id = $survey_id;
        $this->user_id = $user_id;
        $this->answer = $answer;
        $this->question_id = $question_id;
    }
}
?>