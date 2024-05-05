({
    numberClicked: function (component, event, helper) {
     	helper.numberClicked(component, event);
    },

    calculate: function (component, event, helper) {
       helper.calculate(component, event);
    },

    operatorClicked: function (component, event, helper) {
        helper.operatorClicked(component, event);
    },

    clearClicked: function (component, event, helper) {
        helper.clearClicked(component, event);
    },
   clearLastNumberClicked: function (component, event, helper) {
    helper.clearLastNumberClicked(component);
},

})