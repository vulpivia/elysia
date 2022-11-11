class Util {
	/**
		Convert a timestamp to a displayable format.

		@param timestamp The timestamp to format.
		@return A string of hours, minutes and seconds since the beginning of the timestamp in the format "HH:MM:SS".
	**/
	public static function displayTime(timestamp:Float):String {
		var hours = Math.floor(timestamp / (60 * 60));
		var minutes = Math.floor((timestamp / 60) % 60);
		var seconds = Math.floor(timestamp % 60);

		var minutesStr = (minutes < 10 ? "0" : "") + minutes;
		var secondsStr = (seconds < 10 ? "0" : "") + seconds;

		return hours + ":" + minutesStr + ":" + secondsStr;
	}
}
