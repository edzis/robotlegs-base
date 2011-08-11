package com.agency.client.project {
	import logmeister.connectors.MonsterDebuggerConnector;
	import logmeister.connectors.MonsterDebuggerV2Connector;
	import logmeister.connectors.FlashConnector;
	import logmeister.LogMeister;
	import flash.display.Sprite;

	public class Main extends Sprite {
		protected var context : Context;
		
		[SWF(width="980", height="700", backgroundColor="#00000", frameRate="31")]
		public function Main() {
			
			//Instatiate the logger
			LogMeister.addLogger(new MonsterDebuggerConnector(stage));
			
			context = new Context(this);
		}
	}
}