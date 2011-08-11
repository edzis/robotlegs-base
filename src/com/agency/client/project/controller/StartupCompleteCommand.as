package com.agency.client.project.controller {
	import com.agency.client.project.utils.FlashVars;
	import com.agency.utils.Environment;

	import org.assetloader.core.IAssetLoader;
	import org.robotlegs.mvcs.SignalCommand;

	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	public class StartupCompleteCommand extends SignalCommand {
		[Inject]
		public var assetLoader : IAssetLoader;
		[Inject]
		public var flashvars : FlashVars;
		[Inject]
		public var environment : Environment;

		override public function execute() : void {
			contextView.stage.scaleMode = StageScaleMode.NO_SCALE;
			contextView.stage.align = StageAlign.TOP_LEFT;
			
			//Set up our environment
			environment.setPaths("", "");

			// Load up our config.xml
			assetLoader.addConfig(flashvars.basePath + "assets/config.xml");

			// Map the onConfigLaoded to then kick off loading the 'real' asssets
			signalCommandMap.mapSignal(assetLoader.onConfigLoaded, ConfigCompleteCommand);

			// Kick off the inial config load
			assetLoader.start();
		}
	}
}
