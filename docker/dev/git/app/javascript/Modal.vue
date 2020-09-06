<template>
  <transition name="modal">
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div class="modal-container">
          <div class="modal-header">
            <slot name="header"></slot>
          </div>

          <div class="modal-body">
            <slot name="body"></slot>
          </div>

          <div class="modal-footer">
            <slot name="footer">
              <button class="modal-default-button-yes" @click="$emit('ok')">OK</button>
              <button class="modal-default-button-no" @click="$emit('cancel')">Cancel</button>
            </slot>
          </div>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
export default {};
</script>

<style scoped>
.modal-mask {
  position: fixed;
  z-index: 9998;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: table;
  transition: opacity 0.3s ease;
}
.modal-wrapper {
  display: table-cell;
  vertical-align: middle;
}
.modal-container {
  width: 300px;
  margin: 0px auto;
  padding: 20px 30px;
  background-color: #fff;
  border-radius: 2px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.33);
  transition: all 0.3s ease;
  font-family: Helvetica, Arial, sans-serif;
}
.modal-header h3 {
  margin-top: 0;
  color: #42b983;
}
.modal-body {
  margin: 50px 0;
  font-size: 15px;
}
.modal-footer {
  font-size: 15px;
}
.modal-default-button-yes {
  /* float: right; */
  position: relative;
  display: inline-block;
  padding: 0.25em 0.5em;
  text-decoration: none;
  color: #ff3366;
  background: #fff; /*色*/
  border: solid 1px#ddd; /*線色*/
  border-radius: 4px;
  box-shadow: inset 0 1px 0 #ddd;
  text-shadow: 0 1px 0 #ddd;
}

.modal-default-button-no {
  position: relative;
  display: inline-block;
  padding: 0.25em 0.5em;
  text-decoration: none;
  color: black;
  background: #fff; /*色*/
  border: solid 1px#ddd; /*線色*/
  border-radius: 4px;
  box-shadow: inset 0 1px 0 #ddd;
  text-shadow: 0 1px 0 #ddd;
}

.modal-enter {
  opacity: 0;
}
.modal-enter .modal-container,
.modal-leave-active .modal-container {
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}
</style>
