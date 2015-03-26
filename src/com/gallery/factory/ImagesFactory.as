package com.gallery.factory
{
	/**
	 * @author aberestovskyi
	 */
	public class ImagesFactory
	{
		private static const IMAGE_0:String = "assets/l1.jpg";
		private static const IMAGE_1:String = "assets/p1.jpg";
		private static const IMAGE_2:String = "assets/l2.jpg";
		private static const IMAGE_3:String = "assets/p2.jpg";
		private static const IMAGE_4:String = "assets/l3.jpg";
		private static const IMAGE_5:String = "assets/p3.jpg";
		private static const IMAGE_6:String = "assets/l4.jpg";
		private static const IMAGE_7:String = "assets/p4.jpg";
		private static const IMAGE_8:String = "assets/l5.jpg";
		private static const IMAGE_9:String = "assets/p5.jpg";
		
		
		public static function getImageURL(id:int):String
		{
			return ImagesFactory["IMAGE_"+id];
		}
	}
}
