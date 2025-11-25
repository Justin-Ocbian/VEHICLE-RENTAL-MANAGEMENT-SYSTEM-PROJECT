<?php
// Database connection parameters
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "VEHICLE_RENTAL_MANAGEMENT_SYSTEM"; 

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
// Optional: echo "Connected successfully";
?>
