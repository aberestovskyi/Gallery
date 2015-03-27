package 
{
	import tests.TestArraysTask;

	import org.flexunit.internals.TraceListener;
	import org.flexunit.runner.FlexUnitCore;

	import flash.display.MovieClip;

	/**
	 * @author aberestovskyi
	 */
	public class FlexUnitRunner extends MovieClip 
	{
		public function FlexUnitRunner() 
		{
			onCreationComplete();
        }
        
        private function onCreationComplete():void
        {
            var core:FlexUnitCore = new FlexUnitCore();
            core.addListener(new TraceListener());
            core.visualDisplayRoot = stage;
            core.run(TestArraysTask);
        }
	}
}
