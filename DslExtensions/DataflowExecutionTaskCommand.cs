using System.ComponentModel.Composition;  
using System.Linq;  
using NBNW.Dataflow;    
using NBNW.Dataflow.ExtensionEnablement;  
using Microsoft.VisualStudio.Modeling;  
using Microsoft.VisualStudio.Modeling.Diagrams.ExtensionEnablement;    
using Microsoft.VisualStudio.Modeling.ExtensionEnablement;   

namespace DslExtensions
{
    [DataflowCommandExtension]
    public class DataflowExecutionTaskCommand : ICommandExtension
    {
        /// <summary>  
        /// Provides access to current document and selection.  
        /// </summary>  
        [Import]
        IVsSelectionContext SelectionContext { get; set; }

        /// <summary>  
        /// Called when the user selects this command.  
        /// </summary>  
        /// <param name="command"></param>  
        public void Execute(IMenuCommand command)
        {
            // Transaction is required if you want to update elements.  
            using (Transaction t = SelectionContext.CurrentStore
                    .TransactionManager.BeginTransaction("fix names"))
            {
                foreach (TaskShape shape in SelectionContext.CurrentSelection)
                {
                    // TODO change shape style and colour depending on type of domain property set
                    // This is related to the type of execution to be used (execution block because command
                    // is using TaskShape
                    NamedElement element = shape.ModelElement as NamedElement;
                    element.Name = element.Name + " !";
                }
                t.Commit();
            }
        }

        /// <summary>  
        /// Called when the user right-clicks the diagram.  
        /// Determines whether the command should appear.  
        /// This method should set command.Enabled and command.Visible.  
        /// </summary>  
        /// <param name="command"></param>  
        public void QueryStatus(IMenuCommand command)
        {
            command.Enabled =
              command.Visible = (SelectionContext.CurrentSelection.OfType<TaskShape>().Count() > 0);
        }

        /// <summary>  
        /// Called when the user right-clicks the diagram.  
        /// Determines the text of the command in the menu.  
        /// </summary>  
        public string Text
        {
            get { return "TODO: Task menu command"; }
        }
    }
}
