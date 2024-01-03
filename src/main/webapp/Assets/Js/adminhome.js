let sideBarHolder = document.getElementById(`sidebar-holder`);
let sideBar = document.getElementById(`side-bar`);
let toggleBar = document.getElementById(`bars`);
let closeButton = document.getElementById(`close`);

let table = document.getElementsByClassName(`fourth-column`)


toggleBar.addEventListener(`click`, function(){
    sideBarHolder.style.display = `block`;
})

closeButton.addEventListener(`click`, function() {
    sideBarHolder.style.display = `none`;
})

for(let i = 0; i < table.length; i++){

    if(table[i].innerHTML === `false`){
        table[i].innerText = `Inactive`
        table[i].style.color = `red`
    }
    else{
        table[i].innerText = `Active`
        table[i].style.color = `#19d898`
    }
}

