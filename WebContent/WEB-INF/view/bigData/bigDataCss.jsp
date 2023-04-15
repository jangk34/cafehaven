<style>

/* regButton */
.regButton,
.regButton::after {
  -webkit-transition: all 0.3s;
    -moz-transition: all 0.3s;
  -o-transition: all 0.3s;
    transition: all 0.3s;
}
.regButton {
  background: gray;
  border: 3px solid #fff;
  border-radius: 5px;
  color: #fff;

  font-size: 1.6em;
  font-weight: bold;

  position: relative;
  text-transform: uppercase;
}
/*   display: block;
  margin: 1em auto; */
.regButton::before,
.regButton::after {
  background: #fff;
  content: '';
  position: absolute;
  z-index: -1;
}

.regButton:hover {
  color: #2ecc71;
}
.btn-5 {
  overflow: hidden;
}

.btn-5::after {
  /*background-color: #f00;*/
  height: 100%;
  left: -35%;
  top: 0;
  transform: skew(50deg);
  transition-duration: 0.6s;
  transform-origin: top left;
  width: 0;
}

.btn-5:hover:after {
  height: 100%;
  width: 135%;
}

.taCp{
text-align: center; cursor:pointer
}


#tableHs{
width:100%;
}





</style>