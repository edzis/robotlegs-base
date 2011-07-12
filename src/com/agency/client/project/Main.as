package com.agency.client.project {
	import flash.display.Sprite;

	public class Main extends Sprite {
		protected var context : Context;

		public function Main() {
			context = new Context(this);
		}
	}
}