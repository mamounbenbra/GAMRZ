const swipe = () => {
    $( document ).ready(function() {
        $(document).keyup(function(event){
            var key = event.which;
                    switch(key) {
                    case 37:
                        // Key left.
                        var no = document.getElementById("no_btn")
                        console.log(no)
                        no.click()

                        setTimeout(function () {  break; }, 1000);

                    case 39:
                        // Key right.
                        var yes = document.getElementById("yes_btn")
                        console.log(yes)
                        yes.click()
                        setTimeout(function () {  break; }, 1000);
                }
            });
        });
}



  export { swipe } ;
