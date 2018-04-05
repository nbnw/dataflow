using System.Threading.Tasks.Dataflow;

public class Actor1
{
	public class StartPoint1
	{
			
	 // NBNW.Dataflow.StartPoint
			
				
														

				// Flow To: Task1
				// Flow To: Actor1
			
			
	}

	  	public class Task1
	{
			
	 // NBNW.Dataflow.Task
			
				
														

				// Flow To: MergeBranch1
				// Flow To: Actor1
			
							// Flow From: StartPoint1
				// Flow From: Actor1
			
	}

	  	public class MergeBranch1
	{
			
	 // NBNW.Dataflow.MergeBranch
			
				
														

				// Flow To: Task1
				// Flow To: Actor2
				
														

				// Flow To: Task3
				// Flow To: Actor1
			
							// Flow From: Task1
				// Flow From: Actor1
			
	}

	  	public class Task2
	{
			
	 // NBNW.Dataflow.Task
			
				
														

				// Flow To: Synchronization1
				// Flow To: Actor1
			
							// Flow From: Task3
				// Flow From: Actor1
			
	}

	  	public class Synchronization1
	{
			
	 // NBNW.Dataflow.Synchronization
			
				
														

				// Flow To: EndPoint1
				// Flow To: Actor1
			
							// Flow From: Task2
				// Flow From: Actor1
							// Flow From: Task1
				// Flow From: Actor2
			
	}

	  	public class EndPoint1
	{
			
	 // NBNW.Dataflow.Endpoint
			
			
							// Flow From: Synchronization1
				// Flow From: Actor1
			
	}

	  	public class Task3
	{
			
	 // NBNW.Dataflow.Task
			
				
														

				// Flow To: Task2
				// Flow To: Actor1
			
							// Flow From: MergeBranch1
				// Flow From: Actor1
			
	}

	  		}
public class Actor2
{
	public class Task1
	{
			
	 // NBNW.Dataflow.Task
			
				
														

				// Flow To: Synchronization1
				// Flow To: Actor1
			
							// Flow From: MergeBranch1
				// Flow From: Actor1
			
	}

	  		}
public class Actor3
{
		}
