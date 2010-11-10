<?php
/*********************** TO **********************/
$to = "mail@domail.com";													//Quien va a recibir el correo, pueden ser uno o varios, 
																			//separados por comas; p.e:
																			//nombre1<mail1@dominio.com>, nombre2<mail2@dominio.com>, nombre3<mail3@dominio.com>...

/******************** SUBJECT ********************/
$subject = $_POST['subject'];												//El asunto del mail.

/******************** MESSAGE ********************/
$message = "Nombre:" . "\n" . $_POST['name'] . "\n";						//Es importante que todo el mensaje quede dentro de las comillas
$message .= "Comentario:" . "\n" . $_POST['comment'] . "\n";				//Si el mensaje continua, es importante el . antes del signo igual
																			//El cual sirve para unir dos cadenas de texto. Si se requiere un salto de línea, se utiliza "\n"

/******************** HEADERS ********************/
$headers .= "From: " . $_POST['name'] . "<" . $_POST['mail'] . ">\r\n";		//Quien manda el mail, en formato nombre<mail@dominio.com>
$headers .= "Reply-To: " . $_POST['mail'] . "\r\n";							//En caso de que quien recibe el mail responda el correo, a que dirección se envia
$headers .= "X-Mailer: PHP/" . phpversion() . "\r\n";						//La versión de php que se está encargando de hacer el envio del mail
																			//Existen algunas opciones extra para el envio de correos, por ejemplo:

//$headers .= "Cc: test@sitio.com"; 										//Con copia para
//$headers .= "Bcc: test@sitio.com"; 										// Con copia oculta para

$send = mail($to, $subject, $message, $headers);							//La función mail se encarga de hacer el envio, si no se realiza con exito, la variable que tiene
																			//asignada -en este caso $send- será igual a false.
if($send)
	echo "mail enviado";
else
	echo "error al mandar el mail";
?>