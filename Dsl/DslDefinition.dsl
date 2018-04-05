<?xml version="1.0" encoding="utf-8"?>
<Dsl xmlns:dm0="http://schemas.microsoft.com/VisualStudio/2008/DslTools/Core" dslVersion="1.0.0.0" Id="ffb290c4-1bc7-4321-9e94-8116a96438b8" Description="Description for NBNW.Dataflow.Dataflow" Name="Dataflow" DisplayName="Task Flow" Namespace="NBNW.Dataflow" ProductName="Dataflow" CompanyName="NBNW" PackageGuid="50f94825-4600-4c67-b8ec-e2ecd18a1068" PackageNamespace="NBNW.Dataflow" xmlns="http://schemas.microsoft.com/VisualStudio/2005/DslTools/DslDefinitionModel">
  <Classes>
    <DomainClass Id="de912c2a-1ffd-4974-822d-c4565e5c8d10" Description="Overall base class that provides every element with a Name property which acts as its MonikerKey for serialization." Name="NamedElement" DisplayName="Named Element" InheritanceModifier="Abstract" Namespace="NBNW.Dataflow">
      <Properties>
        <DomainProperty Id="d1dab295-cfbf-4c79-ac61-d82a6dcdf443" Description="Description for NBNW.Dataflow.NamedElement.Name" Name="Name" DisplayName="Name" DefaultValue="" IsElementName="true">
          <Notes>
            The XmlPropertyData sets this property as the MonikerKey. It is therefore important that all the Name values are unique before the model is saved to file.
            The IsElementName attribute ensures that this property will be initialized uniquely.
            However, it does not prevent the user from setting different elements to have the same name, which would prevent saving.
            An alternative technique would be to use a property with type /System/Guid as the MonikerKey, which would be less susceptible to interference from the user;
            the downside is that monikers in the saved file would be less readable.
          </Notes>
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
      </Properties>
    </DomainClass>
    <DomainClass Id="b992fca4-66e0-4cd6-aa9d-b7ef80d2fcef" Description="Root element in which others are embedded." Name="FlowGraph" DisplayName="Flow Graph" Namespace="NBNW.Dataflow">
      <Notes>The ElementMergeDirectives specify what classes of element can be dropped onto this one in the editor, and what relationships that action will construct.
        Merges can also be invoked through the API, providing an alternative way to create embedding relationships.
      </Notes>
      <BaseClass>
        <DomainClassMoniker Name="NamedElement" />
      </BaseClass>
      <ElementMergeDirectives>
        <ElementMergeDirective>
          <Notes>Enables comments to be dropped onto the diagram.</Notes>
          <Index>
            <DomainClassMoniker Name="Comment" />
          </Index>
          <LinkCreationPaths>
            <DomainPath>FlowGraphHasComments.Comments</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
        <ElementMergeDirective>
          <Notes>Enables swimlanes (representing Actors) to be dropped onto the diagram.</Notes>
          <Index>
            <DomainClassMoniker Name="Actor" />
          </Index>
          <LinkCreationPaths>
            <DomainPath>FlowGraphHasActors.Actors</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
      </ElementMergeDirectives>
    </DomainClass>
    <DomainClass Id="fd66929f-3ad2-48b7-b910-214eb3d0cc66" Description="Elements that can be connected by Flow links." Name="FlowElement" DisplayName="Flow Element" InheritanceModifier="Abstract" Namespace="NBNW.Dataflow">
      <BaseClass>
        <DomainClassMoniker Name="NamedElement" />
      </BaseClass>
      <Properties>
        <DomainProperty Id="c9d9d4d2-68d2-4267-8845-6ab5dd22522a" Description="" Name="Description" DisplayName="Description" DefaultValue="">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
      </Properties>
      <ElementMergeDirectives>
        <ElementMergeDirective>
          <Notes>Enables a Comment to be dropped onto an element and linked to it in one action.</Notes>
          <Index>
            <DomainClassMoniker Name="Comment" />
          </Index>
          <LinkCreationPaths>
            <DomainPath>ActorHasFlowElements.Actor/!Actor/FlowGraphHasActors.FlowGraph/!FlowGraph/FlowGraphHasComments.Comments</DomainPath>
            <DomainPath>CommentReferencesSubjects.Comments</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
      </ElementMergeDirectives>
    </DomainClass>
    <DomainClass Id="4d8b064e-e227-4728-b7f6-216f45e84ce4" Description="Elements that can be connected by ObjectFlow links." Name="ObjectFlowElement" DisplayName="Object Flow Element" InheritanceModifier="Abstract" Namespace="NBNW.Dataflow">
      <BaseClass>
        <DomainClassMoniker Name="FlowElement" />
      </BaseClass>
    </DomainClass>
    <DomainClass Id="37935c3d-3c68-4083-9f14-2f035002f65a" Description="" Name="Task" DisplayName="Task" Namespace="NBNW.Dataflow">
      <BaseClass>
        <DomainClassMoniker Name="ObjectFlowElement" />
      </BaseClass>
      <Properties>
        <DomainProperty Id="0054a616-c03b-409c-a684-3c71de09669e" Description="" Name="NestedDiagram" DisplayName="Nested Diagram" DefaultValue="">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
        <DomainProperty Id="9fff8859-abe5-463e-ab1e-63749ead13ac" Description="" Name="Sort" DisplayName="Sort" DefaultValue="Regular">
          <Type>
            <DomainEnumerationMoniker Name="TaskSort" />
          </Type>
        </DomainProperty>
      </Properties>
    </DomainClass>
    <DomainClass Id="de13319f-3ede-49d6-bdf1-fdf45b00d914" Description="" Name="StartPoint" DisplayName="Start Point" Namespace="NBNW.Dataflow">
      <BaseClass>
        <DomainClassMoniker Name="FlowElement" />
      </BaseClass>
    </DomainClass>
    <DomainClass Id="b7add809-ea84-4c6f-bdda-e1a5f7cda4e1" Description="" Name="Endpoint" DisplayName="Endpoint" Namespace="NBNW.Dataflow">
      <BaseClass>
        <DomainClassMoniker Name="FlowElement" />
      </BaseClass>
    </DomainClass>
    <DomainClass Id="1b503251-24be-4d07-82b1-6d24bcc01417" Description="" Name="MergeBranch" DisplayName="Merge Branch" Namespace="NBNW.Dataflow">
      <BaseClass>
        <DomainClassMoniker Name="FlowElement" />
      </BaseClass>
    </DomainClass>
    <DomainClass Id="7e5ec438-b0fc-4107-bc63-e06499bba1f3" Description="" Name="Synchronization" DisplayName="Synchronization" Namespace="NBNW.Dataflow">
      <BaseClass>
        <DomainClassMoniker Name="FlowElement" />
      </BaseClass>
    </DomainClass>
    <DomainClass Id="e7ce020f-a6d9-4189-a63c-1d9a34de0acb" Description="" Name="ObjectInState" DisplayName="Object In State" Namespace="NBNW.Dataflow">
      <BaseClass>
        <DomainClassMoniker Name="ObjectFlowElement" />
      </BaseClass>
      <Properties>
        <DomainProperty Id="9c337ee8-89ce-452e-a0d9-72644d532b4c" Description="" Name="State" DisplayName="State" DefaultValue="">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
      </Properties>
    </DomainClass>
    <DomainClass Id="731e7a38-6923-43fc-8af8-5d6731b603e6" Description="Can be attached to any task flow element." Name="Comment" DisplayName="Comment" Namespace="NBNW.Dataflow">
      <Properties>
        <DomainProperty Id="0c3ebbbd-226c-4fc6-9c8e-8375d2b609d8" Description="" Name="Text" DisplayName="Text" DefaultValue="">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
      </Properties>
    </DomainClass>
    <DomainClass Id="c852e7a2-14a8-4957-bb44-7adc74526e29" Description="Represented by a swim lane on the diagram." Name="Actor" DisplayName="Actor" Namespace="NBNW.Dataflow">
      <BaseClass>
        <DomainClassMoniker Name="NamedElement" />
      </BaseClass>
      <ElementMergeDirectives>
        <ElementMergeDirective>
          <Notes>One link is created when a Comment is merged into an Actor:
            - the embedding link DataflowGraphHasComments, from the DataflowGraph to the Comment.
            The embedding link actually starts from the DataflowGraph that owns the Actor,
            so the first part of that path navigates to the owner from the Actor; the last segment defines the link to be created.
            Note that there is no link between the Actor and the Comment.
          </Notes>
          <Index>
            <DomainClassMoniker Name="Comment" />
          </Index>
          <LinkCreationPaths>
            <DomainPath>FlowGraphHasActors.FlowGraph/!FlowGraph/FlowGraphHasComments.Comments</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
        <ElementMergeDirective>
          <Notes>Enables swimlanes (representing Actors) to appear on the diagram.</Notes>
          <Index>
            <DomainClassMoniker Name="Actor" />
          </Index>
          <LinkCreationPaths>
            <DomainPath>FlowGraphHasActors.FlowGraph/!FlowGraph/.Actors</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
        <ElementMergeDirective>
          <Index>
            <DomainClassMoniker Name="FlowElement" />
          </Index>
          <LinkCreationPaths>
            <DomainPath>ActorHasFlowElements.FlowElements</DomainPath>
          </LinkCreationPaths>
        </ElementMergeDirective>
      </ElementMergeDirectives>
    </DomainClass>
  </Classes>
  <Relationships>
    <DomainRelationship Id="00f2a992-ef29-40d0-a2f2-af3229391569" Description="Description for NBNW.Dataflow.Flow" Name="Flow" DisplayName="Flow" Namespace="NBNW.Dataflow">
      <Properties>
        <DomainProperty Id="422cd079-093f-4a2e-9dcc-336018d26293" Description="" Name="Guard" DisplayName="Guard" DefaultValue="">
          <Type>
            <ExternalTypeMoniker Name="/System/String" />
          </Type>
        </DomainProperty>
      </Properties>
      <Source>
        <DomainRole Id="f7172804-7d95-4c46-899c-1c90cf64b763" Description="Description for NBNW.Dataflow.Flow.FlowFrom" Name="FlowFrom" DisplayName="Flow From" PropertyName="FlowTo" PropertyDisplayName="Flow To">
          <RolePlayer>
            <DomainClassMoniker Name="FlowElement" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="b9075a5d-1b44-4e45-9161-700e28bafedc" Description="Description for NBNW.Dataflow.Flow.FlowTo" Name="FlowTo" DisplayName="Flow To" PropertyName="FlowFrom" PropertyDisplayName="Flow From">
          <RolePlayer>
            <DomainClassMoniker Name="FlowElement" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
    <DomainRelationship Id="ba2cdddd-c328-40db-ba8d-be1d2a5190dc" Description="Description for NBNW.Dataflow.FlowGraphHasComments" Name="FlowGraphHasComments" DisplayName="Flow Graph Has Comments" Namespace="NBNW.Dataflow" IsEmbedding="true">
      <Source>
        <DomainRole Id="b60be673-c337-4c00-a253-912856f917b4" Description="Description for NBNW.Dataflow.FlowGraphHasComments.FlowGraph" Name="FlowGraph" DisplayName="Flow Graph" PropertyName="Comments" PropagatesCopy="PropagatesCopyToLinkAndOppositeRolePlayer" PropertyDisplayName="Comments">
          <RolePlayer>
            <DomainClassMoniker Name="FlowGraph" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="2439695a-ee5f-4daa-8657-68c19078c3ba" Description="Description for NBNW.Dataflow.FlowGraphHasComments.Comment" Name="Comment" DisplayName="Comment" PropertyName="FlowGraph" Multiplicity="One" PropagatesDelete="true" PropertyDisplayName="Flow Graph">
          <RolePlayer>
            <DomainClassMoniker Name="Comment" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
    <DomainRelationship Id="1752a2fb-220d-4beb-8983-fec710fe29b9" Description="The set of actors (represented by swim lanes) in the task flow." Name="FlowGraphHasActors" DisplayName="Flow Graph Has Actors" Namespace="NBNW.Dataflow" IsEmbedding="true">
      <Source>
        <DomainRole Id="a89c69eb-7203-438a-8132-982e0abc392f" Description="Description for NBNW.Dataflow.FlowGraphHasActors.FlowGraph" Name="FlowGraph" DisplayName="Flow Graph" PropertyName="Actors" PropagatesCopy="PropagatesCopyToLinkAndOppositeRolePlayer" PropertyDisplayName="Actors">
          <RolePlayer>
            <DomainClassMoniker Name="FlowGraph" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="3365aa06-fb2b-432d-8fa3-047e36b9575f" Description="Description for NBNW.Dataflow.FlowGraphHasActors.Actor" Name="Actor" DisplayName="Actor" PropertyName="FlowGraph" Multiplicity="One" PropertyDisplayName="Flow Graph">
          <RolePlayer>
            <DomainClassMoniker Name="Actor" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
    <DomainRelationship Id="93f0599b-523f-4d21-b80c-b2c068a175a3" Description="Description for NBNW.Dataflow.CommentReferencesSubjects" Name="CommentReferencesSubjects" DisplayName="Comment References Subjects" Namespace="NBNW.Dataflow">
      <Source>
        <DomainRole Id="06d97807-34da-4b51-b7b6-2404fe0f23fa" Description="Description for NBNW.Dataflow.CommentReferencesSubjects.Comment" Name="Comment" DisplayName="Comment" PropertyName="Subjects" PropertyDisplayName="Subjects">
          <RolePlayer>
            <DomainClassMoniker Name="Comment" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="322cadc8-873c-4240-bdfe-5dc9ed204b16" Description="Description for NBNW.Dataflow.CommentReferencesSubjects.Subject" Name="Subject" DisplayName="Subject" PropertyName="Comments" PropertyDisplayName="Comments">
          <RolePlayer>
            <DomainClassMoniker Name="FlowElement" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
    <DomainRelationship Id="eff0554b-c2be-466e-8ca0-bfe23f710e28" Description="Relationship between Tasks and ObjectInStates." Name="ObjectFlow" DisplayName="Object Flow" Namespace="NBNW.Dataflow">
      <Notes>Although this relationship allows links between any pair of elements, it is intended that there should be an ObjectInState at one end or both.
        The ConnectionBuilder for this relationship therefore imposes that restriction: an ObjectFlow link that doesn't involve an ObjectInState at either end
        can therefore not be constructed using the editor. However, it could be constructed through the API.
      </Notes>
      <Source>
        <DomainRole Id="70de70a3-8080-4f83-951b-dfcca7b632b3" Description="Description for NBNW.Dataflow.ObjectFlow.ObjectFlowTo" Name="ObjectFlowTo" DisplayName="Object Flow To" PropertyName="ObjectFlowFrom" PropertyDisplayName="Object Flow From">
          <RolePlayer>
            <DomainClassMoniker Name="ObjectFlowElement" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="a2d0cc59-da46-43e7-b0a5-168e9473c354" Description="Description for NBNW.Dataflow.ObjectFlow.ObjectFlowFrom" Name="ObjectFlowFrom" DisplayName="Object Flow From" PropertyName="ObjectFlowTo" PropertyDisplayName="Object Flow To">
          <RolePlayer>
            <DomainClassMoniker Name="ObjectFlowElement" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
    <DomainRelationship Id="4ecc74a3-839d-4940-b020-cfdd9c7b831a" Description="Description for NBNW.Dataflow.ActorHasFlowElements" Name="ActorHasFlowElements" DisplayName="Actor Has Flow Elements" Namespace="NBNW.Dataflow" IsEmbedding="true">
      <Source>
        <DomainRole Id="1918fce9-522e-4721-b4f6-1eea7642e03e" Description="Description for NBNW.Dataflow.ActorHasFlowElements.Actor" Name="Actor" DisplayName="Actor" PropertyName="FlowElements" PropagatesCopy="PropagatesCopyToLinkAndOppositeRolePlayer" PropertyDisplayName="Flow Elements">
          <RolePlayer>
            <DomainClassMoniker Name="Actor" />
          </RolePlayer>
        </DomainRole>
      </Source>
      <Target>
        <DomainRole Id="2783068c-6d50-4558-8993-bcb70ddb6543" Description="Description for NBNW.Dataflow.ActorHasFlowElements.FlowElement" Name="FlowElement" DisplayName="Flow Element" PropertyName="Actor" Multiplicity="One" PropagatesDelete="true" PropertyDisplayName="Actor">
          <RolePlayer>
            <DomainClassMoniker Name="FlowElement" />
          </RolePlayer>
        </DomainRole>
      </Target>
    </DomainRelationship>
  </Relationships>
  <Types>
    <ExternalType Name="DateTime" Namespace="System" />
    <ExternalType Name="String" Namespace="System" />
    <ExternalType Name="Int16" Namespace="System" />
    <ExternalType Name="Int32" Namespace="System" />
    <ExternalType Name="Int64" Namespace="System" />
    <ExternalType Name="UInt16" Namespace="System" />
    <ExternalType Name="UInt32" Namespace="System" />
    <ExternalType Name="UInt64" Namespace="System" />
    <ExternalType Name="SByte" Namespace="System" />
    <ExternalType Name="Byte" Namespace="System" />
    <ExternalType Name="Double" Namespace="System" />
    <ExternalType Name="Single" Namespace="System" />
    <ExternalType Name="Guid" Namespace="System" />
    <ExternalType Name="Boolean" Namespace="System" />
    <ExternalType Name="Char" Namespace="System" />
    <DomainEnumeration Name="TaskSort" Namespace="NBNW.Dataflow" Description="Description for NBNW.Dataflow.TaskSort">
      <Literals>
        <EnumerationLiteral Description="Description for NBNW.Dataflow.TaskSort.Regular" Name="Regular" Value="0" />
        <EnumerationLiteral Description="Description for NBNW.Dataflow.TaskSort.SuperTask" Name="SuperTask" Value="1" />
      </Literals>
    </DomainEnumeration>
  </Types>
  <Shapes>
    <GeometryShape Id="05007eac-5400-4fc7-ad9c-01038e402b59" Description="Description for NBNW.Dataflow.TaskShape" Name="TaskShape" DisplayName="Task Shape" Namespace="NBNW.Dataflow" FixedTooltipText="Task Shape" FillColor="213, 231, 205" InitialWidth="1.2" InitialHeight="0.35" OutlineThickness="0.01" FillGradientMode="Vertical" Geometry="RoundedRectangle">
      <ShapeHasDecorators Position="Center" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="Name" DisplayName="Name" DefaultText="Name" />
      </ShapeHasDecorators>
      <ShapeHasDecorators Position="InnerBottomRight" HorizontalOffset="0" VerticalOffset="0">
        <IconDecorator Name="SubTask" DisplayName="Sub Task" DefaultIcon="resources\SubTaskIcon.bmp" />
      </ShapeHasDecorators>
    </GeometryShape>
    <GeometryShape Id="139fecea-c10e-4085-b03e-5875ad0be76f" Description="Description for NBNW.Dataflow.CommentBoxShape" Name="CommentBoxShape" DisplayName="Comment Box Shape" Namespace="NBNW.Dataflow" FixedTooltipText="Comment Box Shape" FillColor="255, 255, 204" OutlineColor="204, 204, 102" InitialHeight="0.3" OutlineThickness="0.01" FillGradientMode="None" Geometry="Rectangle">
      <ShapeHasDecorators Position="Center" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="Comment" DisplayName="Comment" DefaultText="Comment" />
      </ShapeHasDecorators>
    </GeometryShape>
    <ImageShape Id="2a84dd5a-ae66-4722-a30c-d068a5d67ec6" Description="Description for NBNW.Dataflow.MergeBranchShape" Name="MergeBranchShape" DisplayName="Merge Branch Shape" Namespace="NBNW.Dataflow" FixedTooltipText="Merge Branch Shape" InitialWidth="0.5" InitialHeight="0.3" OutlineThickness="0.01" Image="resources\decision.emf" />
    <ImageShape Id="1972f849-f360-492a-a200-cf8c4a09ba0e" Description="Description for NBNW.Dataflow.EndShape" Name="EndShape" DisplayName="End Shape" Namespace="NBNW.Dataflow" FixedTooltipText="End Shape" InitialWidth="0.25" InitialHeight="0.25" OutlineThickness="0.01" Image="Resources\Stop.emf" />
    <ImageShape Id="394eaab8-0c8b-43d0-9e87-55972a90cc23" Description="Description for NBNW.Dataflow.StartShape" Name="StartShape" DisplayName="Start Shape" Namespace="NBNW.Dataflow" FixedTooltipText="Start Shape" InitialWidth="0.25" InitialHeight="0.25" OutlineThickness="0.01" Image="Resources\Start.emf" />
    <GeometryShape Id="c66957be-7266-42f3-8564-28e3c8c599fb" Description="Description for NBNW.Dataflow.SyncBarShape" Name="SyncBarShape" DisplayName="Sync Bar Shape" Namespace="NBNW.Dataflow" FixedTooltipText="Sync Bar Shape" FillColor="208, 207, 197" InitialWidth="1" InitialHeight="0.1" OutlineThickness="0.01" FillGradientMode="Vertical" Geometry="Rectangle" />
    <GeometryShape Id="59f719d9-50d4-451d-a44b-43b92358e12c" Description="Description for NBNW.Dataflow.ObjectShape" Name="ObjectShape" DisplayName="Object Shape" Namespace="NBNW.Dataflow" FixedTooltipText="Object Shape" InitialWidth="1.2" InitialHeight="0.4" OutlineThickness="0.01" Geometry="Rectangle">
      <ShapeHasDecorators Position="InnerTopCenter" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="Name" DisplayName="Name" DefaultText="Name" />
      </ShapeHasDecorators>
      <ShapeHasDecorators Position="InnerBottomCenter" HorizontalOffset="0" VerticalOffset="0">
        <TextDecorator Name="State" DisplayName="State" DefaultText="State" FontStyle="Italic" />
      </ShapeHasDecorators>
    </GeometryShape>
    <SwimLane Id="3f1d337c-58cb-411d-948f-096b7c7bb6fc" Description="Description for NBNW.Dataflow.ActorSwimLane" Name="ActorSwimLane" DisplayName="Actor Swim Lane" Namespace="NBNW.Dataflow" FixedTooltipText="Actor Swim Lane" HeaderFillColor="LightBlue" InitialWidth="0" InitialHeight="0" SeparatorThickness="0.01">
      <Decorators>
        <SwimLaneHasDecorators Position="InnerTopCenter" HorizontalOffset="0" VerticalOffset="0">
          <TextDecorator Name="ActorName" DisplayName="Actor Name" DefaultText="ActorName" />
        </SwimLaneHasDecorators>
      </Decorators>
    </SwimLane>
  </Shapes>
  <Connectors>
    <Connector Id="2e9d43e5-d358-4835-abc3-e3dbe2004e1e" Description="Description for NBNW.Dataflow.CommentConnector" Name="CommentConnector" DisplayName="Comment Connector" Namespace="NBNW.Dataflow" FixedTooltipText="Comment Connector" Color="113, 111, 110" DashStyle="Dot" Thickness="0.01" RoutingStyle="Straight" />
    <Connector Id="d625fdc8-e223-40db-95b0-0844b01efb06" Description="Description for NBNW.Dataflow.FlowConnector" Name="FlowConnector" DisplayName="Flow Connector" Namespace="NBNW.Dataflow" FixedTooltipText="Flow Connector" Color="113, 111, 110" TargetEndStyle="EmptyArrow" Thickness="0.01">
      <ConnectorHasDecorators Position="SourceTop" OffsetFromShape="0" OffsetFromLine="0">
        <TextDecorator Name="Guard" DisplayName="Guard" DefaultText="Guard" />
      </ConnectorHasDecorators>
    </Connector>
    <Connector Id="f774af7a-9a6b-4cfe-8b70-c7380557ae1f" Description="Description for NBNW.Dataflow.ObjectFlowConnector" Name="ObjectFlowConnector" DisplayName="Object Flow Connector" Namespace="NBNW.Dataflow" FixedTooltipText="Object Flow Connector" Color="113, 111, 110" DashStyle="Dash" TargetEndStyle="EmptyArrow" Thickness="0.01" />
  </Connectors>
  <XmlSerializationBehavior Name="DataflowSerializationBehavior" Namespace="NBNW.Dataflow">
    <ClassData>
      <XmlClassData TypeName="NamedElement" MonikerAttributeName="name" SerializeId="true" MonikerElementName="namedElementMoniker" ElementName="namedElement" MonikerTypeName="NamedElementMoniker">
        <DomainClassMoniker Name="NamedElement" />
        <ElementData>
          <XmlPropertyData XmlName="name" IsMonikerKey="true">
            <DomainPropertyMoniker Name="NamedElement/Name" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="Flow" MonikerAttributeName="" SerializeId="true" MonikerElementName="flowMoniker" ElementName="flow" MonikerTypeName="FlowMoniker">
        <DomainRelationshipMoniker Name="Flow" />
        <ElementData>
          <XmlPropertyData XmlName="guard">
            <DomainPropertyMoniker Name="Flow/Guard" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="FlowGraphHasComments" MonikerAttributeName="" SerializeId="true" MonikerElementName="flowGraphHasCommentsMoniker" ElementName="flowGraphHasComments" MonikerTypeName="FlowGraphHasCommentsMoniker">
        <DomainRelationshipMoniker Name="FlowGraphHasComments" />
      </XmlClassData>
      <XmlClassData TypeName="CommentReferencesSubjects" MonikerAttributeName="" SerializeId="true" MonikerElementName="commentReferencesSubjectsMoniker" ElementName="commentReferencesSubjects" MonikerTypeName="CommentReferencesSubjectsMoniker">
        <DomainRelationshipMoniker Name="CommentReferencesSubjects" />
      </XmlClassData>
      <XmlClassData TypeName="ObjectFlow" MonikerAttributeName="" SerializeId="true" MonikerElementName="objectFlowMoniker" ElementName="objectFlow" MonikerTypeName="ObjectFlowMoniker">
        <DomainRelationshipMoniker Name="ObjectFlow" />
      </XmlClassData>
      <XmlClassData TypeName="FlowGraph" MonikerAttributeName="" SerializeId="true" MonikerElementName="flowGraphMoniker" ElementName="flowGraph" MonikerTypeName="FlowGraphMoniker">
        <DomainClassMoniker Name="FlowGraph" />
        <ElementData>
          <XmlRelationshipData RoleElementName="comments">
            <DomainRelationshipMoniker Name="FlowGraphHasComments" />
          </XmlRelationshipData>
          <XmlRelationshipData RoleElementName="actors">
            <DomainRelationshipMoniker Name="FlowGraphHasActors" />
          </XmlRelationshipData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="FlowElement" MonikerAttributeName="" SerializeId="true" MonikerElementName="flowElementMoniker" ElementName="flowElement" MonikerTypeName="FlowElementMoniker">
        <DomainClassMoniker Name="FlowElement" />
        <ElementData>
          <XmlPropertyData XmlName="description">
            <DomainPropertyMoniker Name="FlowElement/Description" />
          </XmlPropertyData>
          <XmlRelationshipData UseFullForm="true" RoleElementName="flowTo">
            <DomainRelationshipMoniker Name="Flow" />
          </XmlRelationshipData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="ObjectFlowElement" MonikerAttributeName="" SerializeId="true" MonikerElementName="objectFlowElementMoniker" ElementName="objectFlowElement" MonikerTypeName="ObjectFlowElementMoniker">
        <DomainClassMoniker Name="ObjectFlowElement" />
        <ElementData>
          <XmlRelationshipData UseFullForm="true" RoleElementName="objectFlowFrom">
            <DomainRelationshipMoniker Name="ObjectFlow" />
          </XmlRelationshipData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="Task" MonikerAttributeName="" SerializeId="true" MonikerElementName="taskMoniker" ElementName="task" MonikerTypeName="TaskMoniker">
        <DomainClassMoniker Name="Task" />
        <ElementData>
          <XmlPropertyData XmlName="sort">
            <DomainPropertyMoniker Name="Task/Sort" />
          </XmlPropertyData>
          <XmlPropertyData XmlName="nestedDiagram">
            <DomainPropertyMoniker Name="Task/NestedDiagram" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="StartPoint" MonikerAttributeName="" SerializeId="true" MonikerElementName="startPointMoniker" ElementName="startPoint" MonikerTypeName="StartPointMoniker">
        <DomainClassMoniker Name="StartPoint" />
      </XmlClassData>
      <XmlClassData TypeName="Endpoint" MonikerAttributeName="" SerializeId="true" MonikerElementName="endpointMoniker" ElementName="endpoint" MonikerTypeName="EndpointMoniker">
        <DomainClassMoniker Name="Endpoint" />
      </XmlClassData>
      <XmlClassData TypeName="MergeBranch" MonikerAttributeName="" SerializeId="true" MonikerElementName="mergeBranchMoniker" ElementName="mergeBranch" MonikerTypeName="MergeBranchMoniker">
        <DomainClassMoniker Name="MergeBranch" />
      </XmlClassData>
      <XmlClassData TypeName="Synchronization" MonikerAttributeName="" SerializeId="true" MonikerElementName="synchronizationMoniker" ElementName="synchronization" MonikerTypeName="SynchronizationMoniker">
        <DomainClassMoniker Name="Synchronization" />
      </XmlClassData>
      <XmlClassData TypeName="Comment" MonikerAttributeName="" SerializeId="true" MonikerElementName="commentMoniker" ElementName="comment" MonikerTypeName="CommentMoniker">
        <DomainClassMoniker Name="Comment" />
        <ElementData>
          <XmlPropertyData XmlName="text">
            <DomainPropertyMoniker Name="Comment/Text" />
          </XmlPropertyData>
          <XmlRelationshipData RoleElementName="subjects">
            <DomainRelationshipMoniker Name="CommentReferencesSubjects" />
          </XmlRelationshipData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="ObjectInState" MonikerAttributeName="" SerializeId="true" MonikerElementName="objectInStateMoniker" ElementName="objectInState" MonikerTypeName="ObjectInStateMoniker">
        <DomainClassMoniker Name="ObjectInState" />
        <ElementData>
          <XmlPropertyData XmlName="state">
            <DomainPropertyMoniker Name="ObjectInState/State" />
          </XmlPropertyData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="Actor" MonikerAttributeName="" SerializeId="true" MonikerElementName="actorMoniker" ElementName="actor" MonikerTypeName="ActorMoniker">
        <DomainClassMoniker Name="Actor" />
        <ElementData>
          <XmlRelationshipData RoleElementName="flowElements">
            <DomainRelationshipMoniker Name="ActorHasFlowElements" />
          </XmlRelationshipData>
        </ElementData>
      </XmlClassData>
      <XmlClassData TypeName="FlowGraphHasActors" MonikerAttributeName="" SerializeId="true" MonikerElementName="flowGraphHasActorsMoniker" ElementName="flowGraphHasActors" MonikerTypeName="FlowGraphHasActorsMoniker">
        <DomainRelationshipMoniker Name="FlowGraphHasActors" />
      </XmlClassData>
      <XmlClassData TypeName="TaskShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="taskShapeMoniker" ElementName="taskShape" MonikerTypeName="TaskShapeMoniker">
        <GeometryShapeMoniker Name="TaskShape" />
      </XmlClassData>
      <XmlClassData TypeName="CommentBoxShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="commentBoxShapeMoniker" ElementName="commentBoxShape" MonikerTypeName="CommentBoxShapeMoniker">
        <GeometryShapeMoniker Name="CommentBoxShape" />
      </XmlClassData>
      <XmlClassData TypeName="MergeBranchShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="mergeBranchShapeMoniker" ElementName="mergeBranchShape" MonikerTypeName="MergeBranchShapeMoniker">
        <ImageShapeMoniker Name="MergeBranchShape" />
      </XmlClassData>
      <XmlClassData TypeName="EndShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="endShapeMoniker" ElementName="endShape" MonikerTypeName="EndShapeMoniker">
        <ImageShapeMoniker Name="EndShape" />
      </XmlClassData>
      <XmlClassData TypeName="StartShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="startShapeMoniker" ElementName="startShape" MonikerTypeName="StartShapeMoniker">
        <ImageShapeMoniker Name="StartShape" />
      </XmlClassData>
      <XmlClassData TypeName="SyncBarShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="syncBarShapeMoniker" ElementName="syncBarShape" MonikerTypeName="SyncBarShapeMoniker">
        <GeometryShapeMoniker Name="SyncBarShape" />
      </XmlClassData>
      <XmlClassData TypeName="ObjectShape" MonikerAttributeName="" SerializeId="true" MonikerElementName="objectShapeMoniker" ElementName="objectShape" MonikerTypeName="ObjectShapeMoniker">
        <GeometryShapeMoniker Name="ObjectShape" />
      </XmlClassData>
      <XmlClassData TypeName="ActorSwimLane" MonikerAttributeName="" SerializeId="true" MonikerElementName="actorSwimLaneMoniker" ElementName="actorSwimLane" MonikerTypeName="ActorSwimLaneMoniker">
        <SwimLaneMoniker Name="ActorSwimLane" />
      </XmlClassData>
      <XmlClassData TypeName="CommentConnector" MonikerAttributeName="" SerializeId="true" MonikerElementName="commentConnectorMoniker" ElementName="commentConnector" MonikerTypeName="CommentConnectorMoniker">
        <ConnectorMoniker Name="CommentConnector" />
      </XmlClassData>
      <XmlClassData TypeName="FlowConnector" MonikerAttributeName="" SerializeId="true" MonikerElementName="flowConnectorMoniker" ElementName="flowConnector" MonikerTypeName="FlowConnectorMoniker">
        <ConnectorMoniker Name="FlowConnector" />
      </XmlClassData>
      <XmlClassData TypeName="ObjectFlowConnector" MonikerAttributeName="" SerializeId="true" MonikerElementName="objectFlowConnectorMoniker" ElementName="objectFlowConnector" MonikerTypeName="ObjectFlowConnectorMoniker">
        <ConnectorMoniker Name="ObjectFlowConnector" />
      </XmlClassData>
      <XmlClassData TypeName="DataflowDiagram" MonikerAttributeName="" SerializeId="true" MonikerElementName="dataflowDiagramMoniker" ElementName="dataflowDiagram" MonikerTypeName="DataflowDiagramMoniker">
        <DiagramMoniker Name="DataflowDiagram" />
      </XmlClassData>
      <XmlClassData TypeName="ActorHasFlowElements" MonikerAttributeName="" SerializeId="true" MonikerElementName="actorHasFlowElementsMoniker" ElementName="actorHasFlowElements" MonikerTypeName="ActorHasFlowElementsMoniker">
        <DomainRelationshipMoniker Name="ActorHasFlowElements" />
      </XmlClassData>
    </ClassData>
  </XmlSerializationBehavior>
  <ExplorerBehavior Name="DataflowExplorer" />
  <ConnectionBuilders>
    <ConnectionBuilder Name="FlowBuilder">
      <Notes>This ConnectionBuilder constructs the appropriate type of flow (Flow or ObjectFlow) between Tasks and Objects.</Notes>
      <LinkConnectDirective>
        <Notes>Flows can connect any DataflowElement to any other. But in this connection builder, 
        we are choosy about what we connect from and to. For example, you cannot connect from an EndPoint,
        nor to a StartPoint.</Notes>
        <DomainRelationshipMoniker Name="Flow" />
        <SourceDirectives>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="Task" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="MergeBranch" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="StartPoint" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="Synchronization" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
        </SourceDirectives>
        <TargetDirectives>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="Task" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="MergeBranch" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="Endpoint" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="Synchronization" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
        </TargetDirectives>
      </LinkConnectDirective>
      <LinkConnectDirective>
        <Notes>Connections *to* an Object, from a Task or an Object.</Notes>
        <DomainRelationshipMoniker Name="ObjectFlow" />
        <SourceDirectives>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="Task" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="ObjectInState" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
        </SourceDirectives>
        <TargetDirectives>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="ObjectInState" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
        </TargetDirectives>
      </LinkConnectDirective>
      <LinkConnectDirective>
        <Notes>Connections *from* an Object, to a Task. (Object to Object is covered by the other LinkConnectDirective.)</Notes>
        <DomainRelationshipMoniker Name="ObjectFlow" />
        <SourceDirectives>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="ObjectInState" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
        </SourceDirectives>
        <TargetDirectives>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="Task" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
        </TargetDirectives>
      </LinkConnectDirective>
    </ConnectionBuilder>
    <ConnectionBuilder Name="CommentReferencesSubjectsBuilder">
      <LinkConnectDirective>
        <DomainRelationshipMoniker Name="CommentReferencesSubjects" />
        <SourceDirectives>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="Comment" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
        </SourceDirectives>
        <TargetDirectives>
          <RolePlayerConnectDirective>
            <AcceptingClass>
              <DomainClassMoniker Name="FlowElement" />
            </AcceptingClass>
          </RolePlayerConnectDirective>
        </TargetDirectives>
      </LinkConnectDirective>
    </ConnectionBuilder>
  </ConnectionBuilders>
  <Diagram Id="63de3622-14bd-4c34-829c-bf2a6113ac14" Description="Description for NBNW.Dataflow.DataflowDiagram" Name="DataflowDiagram" DisplayName="Flow Diagram" Namespace="NBNW.Dataflow">
    <Class>
      <DomainClassMoniker Name="FlowGraph" />
    </Class>
    <ShapeMaps>
      <ShapeMap>
        <DomainClassMoniker Name="Task" />
        <ParentElementPath>
          <DomainPath>ActorHasFlowElements.Actor/!Actor</DomainPath>
        </ParentElementPath>
        <DecoratorMap>
          <TextDecoratorMoniker Name="TaskShape/Name" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="NamedElement/Name" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <DecoratorMap>
          <IconDecoratorMoniker Name="TaskShape/SubTask" />
          <VisibilityPropertyPath>
            <DomainPropertyMoniker Name="Task/Sort" />
            <PropertyFilters>
              <PropertyFilter FilteringValue="SuperTask" />
            </PropertyFilters>
          </VisibilityPropertyPath>
        </DecoratorMap>
        <GeometryShapeMoniker Name="TaskShape" />
      </ShapeMap>
      <ShapeMap>
        <DomainClassMoniker Name="Comment" />
        <ParentElementPath>
          <DomainPath>FlowGraphHasComments.FlowGraph/!FlowGraph</DomainPath>
        </ParentElementPath>
        <DecoratorMap>
          <TextDecoratorMoniker Name="CommentBoxShape/Comment" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="Comment/Text" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <GeometryShapeMoniker Name="CommentBoxShape" />
      </ShapeMap>
      <ShapeMap>
        <DomainClassMoniker Name="MergeBranch" />
        <ParentElementPath>
          <DomainPath>ActorHasFlowElements.Actor/!Actor</DomainPath>
        </ParentElementPath>
        <ImageShapeMoniker Name="MergeBranchShape" />
      </ShapeMap>
      <ShapeMap>
        <DomainClassMoniker Name="Endpoint" />
        <ParentElementPath>
          <DomainPath>ActorHasFlowElements.Actor/!Actor</DomainPath>
        </ParentElementPath>
        <ImageShapeMoniker Name="EndShape" />
      </ShapeMap>
      <ShapeMap>
        <DomainClassMoniker Name="StartPoint" />
        <ParentElementPath>
          <DomainPath>ActorHasFlowElements.Actor/!Actor</DomainPath>
        </ParentElementPath>
        <ImageShapeMoniker Name="StartShape" />
      </ShapeMap>
      <ShapeMap>
        <DomainClassMoniker Name="Synchronization" />
        <ParentElementPath>
          <DomainPath>ActorHasFlowElements.Actor/!Actor</DomainPath>
        </ParentElementPath>
        <GeometryShapeMoniker Name="SyncBarShape" />
      </ShapeMap>
      <SwimLaneMap>
        <DomainClassMoniker Name="Actor" />
        <ParentElementPath>
          <DomainPath>FlowGraphHasActors.FlowGraph/!FlowGraph</DomainPath>
        </ParentElementPath>
        <DecoratorMap>
          <TextDecoratorMoniker Name="ActorSwimLane/ActorName" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="NamedElement/Name" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <SwimLane>
          <SwimLaneMoniker Name="ActorSwimLane" />
        </SwimLane>
      </SwimLaneMap>
      <ShapeMap>
        <DomainClassMoniker Name="ObjectInState" />
        <ParentElementPath>
          <DomainPath>ActorHasFlowElements.Actor/!Actor</DomainPath>
        </ParentElementPath>
        <DecoratorMap>
          <TextDecoratorMoniker Name="ObjectShape/Name" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="NamedElement/Name" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <DecoratorMap>
          <TextDecoratorMoniker Name="ObjectShape/State" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="ObjectInState/State" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
        <GeometryShapeMoniker Name="ObjectShape" />
      </ShapeMap>
    </ShapeMaps>
    <ConnectorMaps>
      <ConnectorMap>
        <ConnectorMoniker Name="FlowConnector" />
        <DomainRelationshipMoniker Name="Flow" />
        <DecoratorMap>
          <TextDecoratorMoniker Name="FlowConnector/Guard" />
          <PropertyDisplayed>
            <PropertyPath>
              <DomainPropertyMoniker Name="Flow/Guard" />
            </PropertyPath>
          </PropertyDisplayed>
        </DecoratorMap>
      </ConnectorMap>
      <ConnectorMap>
        <ConnectorMoniker Name="ObjectFlowConnector" />
        <DomainRelationshipMoniker Name="ObjectFlow" />
      </ConnectorMap>
      <ConnectorMap>
        <ConnectorMoniker Name="CommentConnector" />
        <DomainRelationshipMoniker Name="CommentReferencesSubjects" />
      </ConnectorMap>
    </ConnectorMaps>
  </Diagram>
  <Designer CopyPasteGeneration="CopyPasteOnly" FileExtension="dataflow" EditorGuid="c02231ea-cb07-4d4f-867c-2de0329a7f43">
    <RootClass>
      <DomainClassMoniker Name="FlowGraph" />
    </RootClass>
    <XmlSerializationDefinition CustomPostLoad="false">
      <XmlSerializationBehaviorMoniker Name="DataflowSerializationBehavior" />
    </XmlSerializationDefinition>
    <ToolboxTab TabText="Dataflow">
      <ElementTool Name="Task" ToolboxIcon="resources\TaskTool.bmp" Caption="Task" Tooltip="Create a Task" HelpKeyword="CreateTaskF1Keyword">
        <DomainClassMoniker Name="Task" />
      </ElementTool>
      <ElementTool Name="StartPoint" ToolboxIcon="Resources\StartTool.bmp" Caption="Start Point" Tooltip="Create a Start Point" HelpKeyword="CreateStartStateF1Keyword">
        <DomainClassMoniker Name="StartPoint" />
      </ElementTool>
      <ElementTool Name="EndPoint" ToolboxIcon="Resources\EndTool.bmp" Caption="End Point" Tooltip="End Point" HelpKeyword="CreateFinalStateF1Keyword">
        <DomainClassMoniker Name="Endpoint" />
      </ElementTool>
      <ElementTool Name="MergeBranch" ToolboxIcon="resources\MergeBranchTool.bmp" Caption="Merge/Branch" Tooltip="Create a Merge/Branch" HelpKeyword="CreateMergeBranchF1Keyword">
        <DomainClassMoniker Name="MergeBranch" />
      </ElementTool>
      <ElementTool Name="Synchronization" ToolboxIcon="resources\SyncBarTool.bmp" Caption="Synchronization" Tooltip="Create a Synchronization bar" HelpKeyword="Synchronization">
        <DomainClassMoniker Name="Synchronization" />
      </ElementTool>
      <ConnectionTool Name="Flow" ToolboxIcon="resources\FlowTool.bmp" Caption="Flow" Tooltip="Drag between Tasks to create a Flow" HelpKeyword="ConnectFlowF1Keyword">
        <ConnectionBuilderMoniker Name="Dataflow/FlowBuilder" />
      </ConnectionTool>
      <ElementTool Name="ObjectInState" ToolboxIcon="resources\ObjectTool.bmp" Caption="Object In State" Tooltip="Create an Object-In-State" HelpKeyword="CreateObjectInStateF1Keyword">
        <DomainClassMoniker Name="ObjectInState" />
      </ElementTool>
      <ElementTool Name="Comment" ToolboxIcon="resources\CommentTool.bmp" Caption="Comment" Tooltip="Create a Comment" HelpKeyword="CreateCommentF1Keyword">
        <DomainClassMoniker Name="Comment" />
      </ElementTool>
      <ConnectionTool Name="CommentSubjects" ToolboxIcon="resources\CommentConnectorTool.bmp" Caption="Comment Connector" Tooltip="Drag to link a Comment to its subjects" HelpKeyword="ConnectCommentSubjectsF1Keyword">
        <ConnectionBuilderMoniker Name="Dataflow/CommentReferencesSubjectsBuilder" />
      </ConnectionTool>
      <ElementTool Name="Actor" ToolboxIcon="resources\SwimlaneTool.bmp" Caption="Actor swim lane" Tooltip="Create an Actor Swim Lane" HelpKeyword="Actor">
        <DomainClassMoniker Name="Actor" />
      </ElementTool>
    </ToolboxTab>
    <Validation UsesMenu="true" UsesOpen="true" UsesSave="true" UsesCustom="true" UsesLoad="true" />
    <DiagramMoniker Name="DataflowDiagram" />
  </Designer>
  <Explorer ExplorerGuid="84664f78-ffc9-4666-9775-d74f7296bc49" Title="Dataflow Explorer">
    <ExplorerBehaviorMoniker Name="Dataflow/DataflowExplorer" />
  </Explorer>
</Dsl>