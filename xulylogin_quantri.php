<?php 
include('connect.php');
	session_start();
	if(isset($_POST['email'])&&isset($_POST['password'])){
	$email=$_POST['email'];
	$password=$_POST['password'];}
	$a = "SELECT count(*) FROM tb_quantrivien where email='$email'";
	$a1 = "SELECT * FROM tb_quantrivien where email='$email'";
	$result = $conn->prepare($a);
	$result1 = $conn->prepare($a1);
	$result->execute();
	$result1->execute();
	$number_of_rows = $result->fetchColumn(); 
	echo $number_of_rows;
	$user = $result1->fetch(PDO::FETCH_ASSOC);
	$password_hash=$user['password'];
	if($number_of_rows>0){
		if(password_verify($password,$password_hash)){
		//lưu thông tin id user vừa đăng nhập
		$_SESSION['iduser']=$user['id'];
		$_SESSION['username']=$user['name'];
		$_SESSION['email']=$user['email'];
		$_SESSION['password']=$user['password'];
		header('Location:./admin/admin_qlgiangvien.php');
		}
		else{
			header('Location:login.php?role=1&status=false');
		}
	} 
	else{
		header('Location:login.php?role=1&status=false');
	}
	$conn=null;
 ?>