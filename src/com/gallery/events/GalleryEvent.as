package com.gallery.events {
	import flash.events.Event;

	/**
	 * @author aberestovskyi
	 */
	public class GalleryEvent extends Event
	{
		public static const LOADING_COMPLETE:String = "LOADING_COMPLETE";
		public static const IMAGE_CLICK:String = "IMAGE_CLICK";
		public static const LOAD_NEW_IMAGE:String = "LOAD_NEW_IMAGE";
		public static const LOAD_NEW_IMAGE_COMPLETE:String = "LOAD_NEW_IMAGE_COMPLETE";
		public static const REMOVE_IMAGE:String = "REMOVE_IMAGE";
		
		private var _data:Object;
		public function GalleryEvent(type : String, data:Object = null)
		{
			_data = data;
			super(type);
		}

		public function get data() : Object
		{
			return _data;
		}
	}
}
