<?php
include 'config.php';
$sql = "SELECT * FROM `course`";
$result = mysqli_query($db, $sql);
?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
  </head>
  <body>
    <nav class="navbar navbar-expand-lg bg-dark navbar-dark shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="index.php">MTM test</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
        
        </div>
    </div>
    </nav>
    <div class="container">
        <form method="POST" enctype="multipart/form-data">
        
        <br><div class="form-group">
                <label for="exampleInputEmail1">Nama</label>
                <input name="nama" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Nama">
            </div>
            
            <br>
            <label for="exampleInputEmail1">Course</label>
            <select class="form-control" id="select_1" name="course">
            <?php  
                while($user_data = mysqli_fetch_array($result)) {       
            ?>
                <option value="<?php echo $user_data['id_course']; ?>"><?php echo $user_data['course']; ?></option>
            <?php
                            }
            ?>
            </select>
            <br>
            <button type="submit" name="submit" class="btn btn-primary">Submit</button>
        </form>
        
        <?php
        if (isset($_POST['submit'])) {
            $nama=$_POST['nama'];
            $course=$_POST['course'];
            $sql = "INSERT INTO `user_course` (`id_member`, `member_name`) VALUES (NULL, '$nama');";
            $result = mysqli_query($db, $sql);
            $sql = "SELECT id_member FROM `user_course` WHERE member_name = '$nama'";
            $result = mysqli_query($db, $sql);
            $a = mysqli_fetch_array($result);
            $num = $a['id_member'];
            $sql = "INSERT INTO `data_course` (`id_data`, `id_member`, `id_course`) VALUES (NULL, '$num', '$course');";
            $result = mysqli_query($db, $sql);
            header("Location: index.php");
        }
        ?>
    </div>
    <script src="bootstrap/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
  </body>
</html>
