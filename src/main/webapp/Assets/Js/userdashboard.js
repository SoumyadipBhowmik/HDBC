let dashBoardLink = document.getElementById(`dashboard-link`);
let dashBoard = document.getElementById(`dashboard`);
let transactionLink = document.getElementById(`transaction-link`);
let transaction = document.getElementById(`transaction`);
let sendMoneyLink = document.getElementById(`send-money-link`);
let sendMoney = document.getElementById(`send-money`)
let title = document.querySelector(`title`);

dashBoardLink.addEventListener(`click`, function(){
    title.innerHTML = `User | Dashboard`;
    dashBoard.style.display = `block`
    transaction.style.display = `none`;
    sendMoney.style.display = `none`
})

transactionLink.addEventListener(`click`, function(){
    title.innerHTML = `User | Deposit`;
    dashBoard.style.display = `none`;
    transaction.style.display = `block`
    sendMoney.style.display = `none`
})
sendMoneyLink.addEventListener(`click`, function(){
    title.innerHTML = `User | Send Money`;
    dashBoard.style.display = `none`;
    transaction.style.display = `none`
    sendMoney.style.display = `block`
})