const btnHidden = () => {
  const x = document.querySelector("#btn-hidden");
  const y = document.querySelector("#btn-hidden2");
  if (x) {
    x.addEventListener('click', event => {
      console.log(event)
      console.log(y)
      y.classList.remove("d-none");
      x.classList.add("d-none");
    });
  }
}



export { btnHidden } ;


