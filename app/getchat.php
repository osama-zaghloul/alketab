<?php
    $con = mysqli_connect("eltamiuz.net", "eltamiuz_advisor", "XF7JM!?z;KMx", "eltamiuz_advisordb");
    $con->set_charset('utf8');
	
    $sender_id = $_POST["sender_id"];
    $receiver_id = $_POST["receiver_id"];
    
    $statement = mysqli_prepare($con, "SELECT * FROM chats WHERE sender_id = ? AND receiver_id = ?");
    mysqli_stmt_bind_param($statement, "ss", $sender_id, $receiver_id);
    mysqli_stmt_execute($statement);
    
    mysqli_stmt_store_result($statement);
    mysqli_stmt_bind_result($statement, $id, $sender_id, $receiver_id, $sender_type, $receiver_type, $message, $msg_date);
    
    $response = array();
    $response["success"] = false;  
  

    while(mysqli_stmt_fetch($statement)){
	$response["success"] = true; 
	$a['id'] =$id;
	$a['sender_id'] =$sender_id;
	$a['receiver_id'] =$receiver_id;
	$a['sender_type'] =$sender_type;
	$a['receiver_type'] =$receiver_type;
	$a['message'] =$message;
	$a['msg_date'] =$msg_date;
   	$array[]= $a;
    }
    
    echo json_encode($array);
?>