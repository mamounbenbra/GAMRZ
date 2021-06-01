const click = ( ) => {
    function swipe_left() {
        const card = document.querySelector(".main_card");
        if(card){
          card.classList.add("animate__animated", "animate__backOutLeft");
        }
    }
    function swipe_right() {
        const card = document.querySelector(".main_card");
        if (card) {
          card.classList.add("animate__animated", "animate__backOutRight");
        }
    }
  const yes = document.getElementById("yes_btn")
    const no = document.getElementById("no_btn")
    if (yes) {
      yes.addEventListener("click", swipe_right);
    }
    if (no) {
      no.addEventListener("click", swipe_left);
    }
}

export { click }
