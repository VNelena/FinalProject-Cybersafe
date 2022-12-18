<?php

use PHPMailer\PHPMailer\PHPMailer; 

use PHPMailer\PHPMailer\Exception;

    class sendEmail

    {

        function send($code)

        {

 

        require 'PHPMailer/src/Exception.php';

        require 'PHPMailer/src/PHPMailer.php';

        require 'PHPMailer/src/SMTP.php';

        // create object of PHPMailer class with boolean parameter which sets/unsets exception.

        $mail = new PHPMailer(true);                              

        try {

            $mail->isSMTP(); // using SMTP protocol                                     

            $mail->Host = 'smtp.mailtrap.io'; // SMTP host as gmail 

            $mail->SMTPAuth = true;  // enable smtp authentication    

            $mail->Username = '4fdd5a8cb6f1f5';  // sender gmail host              

            $mail->Password = '1a67b77711809f'; // sender gmail host password                          

            $mail->SMTPSecure = 'tls';  // for encrypted connection                           

            $mail->Port = 587;   // port for SMTP     

            $mail->isHTML(true); 

            $mail->setFrom('sender@gmail.com', "Sender"); // sender's email and name

            $mail->addAddress('receiver@gmail.com', "Receiver");  // receiver's email and name

            $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n"; 

            $mail->Subject = 'Email verification';

            $mail->Body    = 'Please click this button to verify your account: <a href=http://localhost/verification/verify.php?code='.$code.'>Verify</a>' ;

 

            $mail->send();

            echo 'Message has been sent';

        } catch (Exception $e) { // handle error.

            echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;

        }

        }

    }

$sendMl = new sendEmail();

?>