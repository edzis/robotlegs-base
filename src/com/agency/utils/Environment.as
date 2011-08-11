package com.agency.utils {
	import flash.system.Capabilities;
	import flash.utils.getQualifiedClassName;

	/**
	 * A small Singleton utility class that allows you to set debug and live path variables for local and remote testing without having to toggle anything.
	 * 
	 * @author Joshua Perez [http://www.joshua-studios.com]
	 * @author Matt Przybylski [http://www.reintroducing.com]
	 * @version 2.0
	 */
	public class Environment {
		// - PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		// singleton instance
		private static var _instance : Environment;
		private static var _allowInstance : Boolean;
		private var _debugPath : String;
		private var _livePath : String;
		private var _basePath : String;
		private var _isLive : Boolean;

		// - PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		// - CONSTRUCTOR	-------------------------------------------------------------------------------------------
		public function Environment() {
		}

		// - PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------
		private function setProperPath() : void {
			if (Capabilities.playerType == "PlugIn" || Capabilities.playerType == "ActiveX") {
				_basePath = _livePath;
				_isLive = true;
			} else {
				_basePath = _debugPath;
				_isLive = false;
			}
		}

		// - PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		/**
		 * Sets the proper debug/live paths.
		 * 
		 * @param $debugPath A string representing the local (debug) path
		 * @param $livePath A string representing the remote (live) path
		 * 
		 * @return void
		 */
		public function setPaths($debugPath : String, $livePath : String) : void {
			_debugPath = $debugPath;
			_livePath = $livePath;

			setProperPath();
		}

		/**
		 * Returns a player and environment info string.
		 */
		public function getPlayerInfo() : String {
			var debugger : String = (Capabilities.isDebugger) ? " / Debugger" : "";
			var info : String = String("Flash Platform: " + Capabilities.version + " / " + Capabilities.playerType + debugger + " / " + Capabilities.os + " / " + Capabilities.screenResolutionX + "x" + Capabilities.screenResolutionY);

			return info;
		}

		// - EVENT HANDLERS ----------------------------------------------------------------------------------------
		// - GETTERS & SETTERS -------------------------------------------------------------------------------------
		/**
		 * Returns the basePath for use in loading assets.
		 * 
		 * @return String
		 */
		public function get basePath() : String {
			return _basePath;
		}

		/**
		 * Returns a Boolean value if the site is on a live server or being tested locally.
		 * 
		 * @return Boolean
		 */
		public function get isLive() : Boolean {
			return _isLive;
		}

		// - HELPERS -----------------------------------------------------------------------------------------------
		public function toString() : String {
			return getQualifiedClassName(this);
		}
		// - END CLASS ---------------------------------------------------------------------------------------------
	}
}