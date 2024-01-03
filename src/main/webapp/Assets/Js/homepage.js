let leftPage = document.getElementById(`left-page`);
let rightPage = document.getElementById(`right-page`);
let modeSlider = document.getElementById(`slider`);
let mode = document.getElementById(`mode`);
let loginType = document.getElementById(`login-type`)
let hdbcLogo = document.querySelectorAll(`span`);
let userLoginPage = document.getElementById(`customer-login-page`);
let adminLoginPage = document.getElementById(`admin-login-page`);
let docTitle = document.querySelector(`title`);
let createAccount = document.getElementById(`create-account-link`);
let signUpPage = document.getElementById(`sign-up-page`);
let closeSignUp = document.getElementById(`close`);
let userPassword = document.getElementById(`createPassword`);
let confirmPassword = document.getElementById(`confirmPassword`);
let submitButton = document.getElementById(`create-submit`);

let states = {
    logger: [`Admin`, `User`],
    value: 0,
    color: [`#F05941`, `#22092C`],
    display: [`block`, `none`],
    title: [`Login`, `Admin`, `Signup`]
};

function loginAnimations(){

mode.addEventListener(`click`, function(){

    if(states.value === 0){
        modeSlider.style.left = '50%';
        rightPage.style.backgroundColor = `${states.color[0]}`;
        loginType.innerText = `${states.logger[0]}`;
        loginType.style.color = `${states.color[1]}`;
        hdbcLogo[0].style.color = `${states.color[1]}`;
        hdbcLogo[1].style.color = `${states.color[1]}`;
        hdbcLogo[2].style.color = `${states.color[1]}`;
        hdbcLogo[3].style.color = `${states.color[1]}`;
        states.value = 50;
        userLoginPage.style.display = `${states.display[1]}`;
        adminLoginPage.style.display = `${states.display[0]}`;
        docTitle.innerText = `HDBC | ${states.title[1]}`;
    }
    else{
        modeSlider.style.left = '0%';
        rightPage.style.backgroundColor = `${states.color[1]}`;
        loginType.innerText = `${states.logger[1]}`;
        loginType.style.color = `${states.color[0]}`;
        hdbcLogo[0].style.color = `${states.color[0]}`;
        hdbcLogo[1].style.color = `${states.color[0]}`;
        hdbcLogo[2].style.color = `${states.color[0]}`;
        hdbcLogo[3].style.color = `${states.color[0]}`;
        states.value = 0;
        userLoginPage.style.display = `${states.display[0]}`;
        adminLoginPage.style.display = `${states.display[1]}`;
        docTitle.innerText = `HDBC | ${states.title[0]}`;
    }
})
}
function signUp(){

    confirmPassword.addEventListener(`keyup`, () => {

        (userPassword.value === confirmPassword.value) ? submitButton.style.display = `${states.display[0]}`: submitButton.style.display = `${states.display[1]}`;
    })
    userPassword.addEventListener(`keyup`, () => {

        (userPassword.value === confirmPassword.value) ? submitButton.style.display = `${states.display[0]}`: submitButton.style.display = `${states.display[1]}`;
    })


    closeSignUp.addEventListener(`click`, ()=> {
        docTitle.innerHTML = `HDBC | ${states.title[0]}`;
        signUpPage.style.display = `${states.display[1]}`;
    })
    createAccount.addEventListener(`click`, ()=>{
        docTitle.innerHTML = `HDBC | ${states.title[2]}`;
        signUpPage.style.display = `${states.display[0]}`;
    })
}
loginAnimations();
signUp();