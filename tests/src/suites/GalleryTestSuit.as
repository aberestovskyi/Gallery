package suites
{
	import cases.TestArraysTask;
	import cases.TestGalleryModel;
	import cases.TestWebGalleryService;
	/**
	 * @author aberestovskyi
	 */
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class GalleryTestSuit
	{
		public var testWebGalleryService:TestWebGalleryService;
		public var testGalleryModel:TestGalleryModel;
		public var testArraysTask:TestArraysTask;
	}
}
