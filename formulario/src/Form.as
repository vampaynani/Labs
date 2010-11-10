package  {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLVariables;
	import flash.net.URLRequestMethod;
	import flash.events.Event;
	
	public class Form extends MovieClip {

		public function Form() {
			send_btn.addEventListener(MouseEvent.CLICK, sendMail);
		}
		private function sendMail(event:MouseEvent):void
		{
			var params:URLVariables = new URLVariables();
			var request:URLRequest = new URLRequest("http://ewex.com.mx/labs/formulario/services/mail.php");
			var loader:URLLoader = new URLLoader();
			
			params.name = name_txt.text;
			params.mail = mail_txt.text;
			params.subject = subject_txt.text;
			params.comment = message_txt.text;
			
			request.method=URLRequestMethod.POST;
			request.data=params;
			
			loader.dataFormat=URLLoaderDataFormat.TEXT;
			loader.addEventListener(Event.COMPLETE, mailSended);
			
			status_txt.text = "enviando...";
			
			try{
				loader.load(request);
			}
			catch (error:Error) {
				trace("Unable to load URL");
			}
		}
		
		private function mailSended(event:Event):void
		{
			var rawData:String = event.target.data as String;
			name_txt.text = "";
			mail_txt.text = "";
			subject_txt.text = "";
			message_txt.text ="";
			status_txt.text = rawData;
		}
	}
	
}
