#region Using directives

using System;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.ConstrainedExecution;

#endregion

//
// General Information about an assembly is controlled through the following 
// set of attributes. Change these attribute values to modify the information
// associated with an assembly.
//
[assembly: AssemblyTitle(@"")]
[assembly: AssemblyDescription(@"")]
[assembly: AssemblyConfiguration("")]
[assembly: AssemblyCompany(@"NBNW")]
[assembly: AssemblyProduct(@"Dataflow")]
[assembly: AssemblyCopyright("")]
[assembly: AssemblyTrademark("")]
[assembly: AssemblyCulture("")]
[assembly: System.Resources.NeutralResourcesLanguage("en")]

//
// Version information for an assembly consists of the following four values:
//
//      Major Version
//      Minor Version 
//      Build Number
//      Revision
//
// You can specify all the values or you can default the Revision and Build Numbers 
// by using the '*' as shown below:

[assembly: AssemblyVersion(@"1.0.0.0")]
[assembly: ComVisible(false)]
[assembly: CLSCompliant(true)]
[assembly: ReliabilityContract(Consistency.MayCorruptProcess, Cer.None)]

//
// Make the Dsl project internally visible to the DslPackage assembly
//
[assembly: InternalsVisibleTo(@"NBNW.Dataflow.DslPackage, PublicKey=0024000004800000940000000602000000240000525341310004000001000100A584A93F9C0AD2F94200EFD0B182335B4076152C79ADB2C45F367C434FD013C77B9F86F791BAF4088C7766FD32E93E2BCB59F0847CAAC0B98EC596489F501EF512008931A8FA430B9BF3C2233110D838AD500B01846F712894B2C16961B12B6BD97832DAF4DA4566F426FAB7D34D0A30AB4C16766811A81B46DE2A3F16A64ABD")]