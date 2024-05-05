({
    numberClicked: function (component, event) {
    
        if (component.get("v.strOperator") === '=') {
            component.set("v.strInput", "");
            component.set("v.strOperator", "NA");
        }
        
        let numClicked = event.target.innerText;
        
 
        if (numClicked === '.' && component.get("v.strCurrentNumber").includes('.')) {
            return;
        }

        if (numClicked === '%' && component.get("v.strCurrentNumber").includes('%')) {
            return;
        }
        if (numClicked === '√' && component.get("v.strCurrentNumber").includes('√')) {
            return;
        }
      
        if (numClicked !== '√') {
            component.set("v.strInput", component.get("v.strInput") + numClicked);
            let strCurrentNumber = component.get("v.strCurrentNumber");
            if (strCurrentNumber) {
                component.set("v.strCurrentNumber", strCurrentNumber + numClicked);
            } else {
                component.set("v.strCurrentNumber", numClicked);
            }
        } else {
            component.set("v.strInput", numClicked + component.get("v.strInput"));
            component.set("v.strOperator", numClicked);
        }
    },
    
    calculate: function (component, event) {
        let lstNumbers = component.get("v.lstNumbers");
        lstNumbers.push(Number(component.get("v.strCurrentNumber")));
        
        let result = 0;
        switch (component.get("v.strOperator")) {
            case '+':
                result = lstNumbers.reduce((acc, num) => acc + num, 0);
                break;
            case '-':
                result = lstNumbers.reduce((acc, num) => acc - num);
                break;
            case '/':
                result = lstNumbers.reduce((acc, num) => acc / num);
                break;
            case 'x':
                result = lstNumbers.reduce((acc, num) => acc * num, 1);
                break;
            case '%':
                let fnumber = lstNumbers[0];
                let Snumber = lstNumbers[1];
                if (component.get("v.strInput").includes('+')) {
                    result = fnumber + (fnumber * (Snumber / 100));
                } else if (component.get("v.strInput").includes('-')) {
                    result = fnumber - (fnumber * (Snumber / 100));
                } else if (component.get("v.strInput").includes('*')) {
                    result = fnumber * (fnumber * (Snumber / 100));
                } else {
                    result = fnumber * Snumber / 100;
                }
                break;
                
            default:
                console.log("Operador inválido");
        }
        
        component.set("v.result", result);
        component.set("v.lstNumbers", []);
        component.set("v.strCurrentNumber", "");
        component.set("v.strOperator", '=');
    },
    
    operatorClicked: function (component, event) {
        let op = event.target.innerText;
        component.set("v.strInput", component.get("v.strInput") + ' ' + op + ' ');
        component.set("v.strOperator", op);
        
        let lstNumbers = component.get("v.lstNumbers");
        lstNumbers.push(Number(component.get("v.strCurrentNumber")));
        component.set("v.lstNumbers", lstNumbers);
        component.set("v.strCurrentNumber", "");
    },
    
    clearClicked: function (component, event) {
        component.set("v.lstNumbers", []);
        component.set("v.strCurrentNumber", "");
        component.set("v.strInput", "");
        component.set("v.strOperator", "NA");
        component.set("v.result", 0);
    },
    
    clearLastNumberClicked: function (component) {
        let strInput = component.get("v.strInput");
        if (strInput) {
            strInput = strInput.slice(0, -1);
            component.set("v.strInput", strInput);
        }
    },
})