package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	public class LiquidDesign extends MovieClip {

		public function LiquidDesign():void {
			// constructor code
			setPositions();
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.addEventListener(Event.RESIZE, resized);
		}
		public function resized(event:Event):void{
			setPositions();
		}
		public function setPositions():void
		{
			arrizq.x = 10;
			arrizq.y=10;
			centro.x = stage.stageWidth/2-centro.width/2; //El centro del escenario menos la mitad de la longitud del objeto
			centro.y = stage.stageHeight/2-centro.height/2;
			abader.x = stage.stageWidth-abader.width-10; //Como el ancho solo se sabe de manera dinámica, al ancho del Stage le restamos el ancho de la figura y el margen que deseamos darle
			abader.y = stage.stageHeight-abader.height-10;
		}
	}
	
}
