//here you place the ids of every element you want.
var ids=new Array('Simple','URL','Question', 'Submit');

function moveItem(fromBox, toBox) {
	var newText = null;
	var newValue = null;
	var newOption = null;
	
	if (fromBox.selectedIndex >= 0) {
		for (var i = 0; i < fromBox.length; i++) {
			if (fromBox.options[i].selected) {
				newText = fromBox.options[i].text;
				newValue = fromBox.options[i].value;

				newOption = new Option(newText, newValue);

				toBox[toBox.length] = newOption;
			}
		}

		for (var i = 0; i < toBox.length; i++) {
			for (var j = 0; j < fromBox.length; j++) {
				if (fromBox[j].value == toBox[i].value) {
					fromBox[j] = null;

					break;
				}
			}
		}
	}
}

function hideallids() {
	//loop through the array and hide each element by id
	for (var i=0;i<ids.length;i++) {
		hidediv(ids[i]);
	}		  
}

function hidediv(id) {
	//safe function to hide an element with a specified id
	if (document.getElementById) { // DOM3 = IE5, NS6
		document.getElementById(id).style.display = 'none';
	}
	else {
		if (document.layers) { // Netscape 4
			document.id.display = 'none';
		}
		else { // IE 4
			document.all.id.style.display = 'none';
		}
	}
}

function showdiv(id) {
	//safe function to hide an element with a specified id
	if (document.getElementById) { // DOM3 = IE5, NS6
		document.getElementById(id).style.display = 'block';
	}
	else {
		if (document.layers) { // Netscape 4
			document.id.display = 'block';
		}
		else { // IE 4
			document.all.id.style.display = 'block';
		}
	}
}

function hideShowTextFields(selection) {
	// hide / show divs for object text fields
	
	hideallids();
	hidediv('QuestOpen');
	
	if(selection.value=='Simple') {
		showdiv(ids[0]);
		showdiv(ids[3]);
	}
	if(selection.value=='URL') {
		showdiv(ids[0]);
		showdiv(ids[1]);
		showdiv(ids[3]);
	}
	if(selection.value=='Question') {
		showdiv(ids[0]);
		showdiv(ids[2]);
		showdiv(ids[3]);
	}	
}

function hideShowOpenQuest(selection) {
	// hide / show divs for object text fields
	
	if(selection.value=='1') { //Open
		showdiv('QuestOpen');
	}
	else 
		hidediv('QuestOpen');
	
}

function checkUncheckAll(theElement) {
	var theForm = theElement.form, z = 0;
	for(z=0; z<theForm.length;z++){
		if(theForm[z].type == 'checkbox' && theForm[z].name!='checkall') {
			theForm[z].checked = theElement.checked;
	  	}
	}
}

function Block(esto,id)
{
       var targetElement = document.getElementById(id);
	   if(esto.value=='1')
	    	targetElement.style.display="none";
	    else
			targetElement.style.display="block";
}

function BlockLongs(esto,id)
{
       var targetElement = document.getElementById(id);
	   if(esto.value=='4')
	    	targetElement.style.display="none";
	    else
			targetElement.style.display="block";
}

function BlockLongsDefault(ocultar,id)
{
       var targetElement = document.getElementById(id);
	   if(ocultar=='1')
	    	targetElement.style.display="none";
	    else
			targetElement.style.display="block";
}

