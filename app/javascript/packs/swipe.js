const swipe = () => {
    if (document.querySelector(".main_card")){

        $(document).keyup(function(event){
            var key = event.which;
                    switch(key) {
                    case 37:
                        // Key left.
                        var no = document.getElementById("no_btn");
                        const card = document.querySelector(".main_card");
                        card.classList.add("animate__animated", "animate__backOutLeft");
                        no.click();
                        break;

                    case 39:
                        // Key right.
                        var yes = document.getElementById("yes_btn")
                        const card2 = document.querySelector(".main_card");
                        card2.classList.add("animate__animated", "animate__backOutRight");
                        yes.click()
                        break;
                }
            });
        }
}



  export { swipe } ;
