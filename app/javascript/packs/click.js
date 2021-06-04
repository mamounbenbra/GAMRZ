
const click = ( ) => { 
    if (document.querySelector(".main_card")){

        const swipe_left = () => {
            const card = document.querySelector(".main_card");
            card.classList.add("animate__animated", "animate__backOutLeft");
        }
        const swipe_right = () => {
            const card = document.querySelector(".main_card");
            card.classList.add("animate__animated", "animate__backOutRight");
        } 

        document.getElementById("no_btn").addEventListener("click", swipe_left);
        document.getElementById("yes_btn").addEventListener("click", swipe_right);
    }
}

export { click }
