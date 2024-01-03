let spans = document.querySelectorAll(`span`);

function lettermerge(){

let arrayOfspans = [spans[0], spans[1], spans[2], spans[3], spans[4], spans[5], spans[6], spans[7], spans[8], spans[9], spans[10], spans[11], spans[12], spans[13], spans[14], spans[15], spans[16], spans[17], spans[18], spans[19], spans[20], spans[21], spans[22], spans[23], spans[24], spans[25], spans[26], spans[27], spans[28], spans[29], spans[30]];

let i = 0;
let flag = true;

setInterval(function(){
    if(i < arrayOfspans.length){

        if(flag === true){
            arrayOfspans[i].style.display = `none`;
            i++;
            console.log(flag);
        }
        else{
            arrayOfspans[i].style.display = `inline`
            i++;
            if(i >= 31){
                flag = true;
                i = 0;
            }
            console.log(flag);
        }
    }
    else{
        flag = false;
        i = 0;
    }
},100);

}

lettermerge();
