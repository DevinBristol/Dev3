({
	init : function(component, event, helper) {
        // find the component whose aura:id is s"flowData"
        var flow=component.find("flowData");
        // start your flow
        flow.startFlow("Get_Primary_Contact");
	}
})