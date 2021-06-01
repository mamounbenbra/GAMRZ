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
                        break;

                    case 39:
                        // Key right.
                        var yes = document.getElementById("yes_btn")
                        console.log(yes)
                        yes.click()
                        break;
                }
            });
        });
}



  export { swipe } ;
