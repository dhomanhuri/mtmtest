<?php 

include "config.php"; 

if (isset($_GET['id'])) {
    $user_id = $_GET['id'];
    $sql = "DELETE FROM `data_course` WHERE `id_data`='$user_id'";
    $result = $db->query($sql);
    if ($result == TRUE) {
        header("Location: index.php?hapus=berhasil");
    }else{
        echo "Error:" . $sql . "<br>" . $conn->error;
    }
} 

?>
