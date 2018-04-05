using NBNW.Dataflow;  
using NBNW.Dataflow.ExtensionEnablement;  
using Microsoft.VisualStudio.Modeling.Validation;  

namespace DslExtensions
{
    class DataflowModelElementNameValidation  
    {
        [DataflowValidationExtension]
        [ValidationMethod(ValidationCategories.Save | ValidationCategories.Open | ValidationCategories.Menu)]
        private void ValidateClassNames(ValidationContext context, NamedElement elementToValidate)
        {
            if (elementToValidate.Name.IndexOf(' ') >= 0)
            {
                context.LogError("Name must not contain spaces", "DataflowClassName", elementToValidate);
            }
        }
    }
}