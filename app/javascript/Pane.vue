<template>
  <form @submit.prevent="$emit('submit')">
    <div v-if="errors.length !=0">
      <ul v-for="e in errors" :key="e">
        <li>
          <font color="red">{{ e }}</font>
        </li>
      </ul>
    </div>
    <div>
      <label>Discipline</label>
      <input v-model="menu.discipline" type="text" />
    </div>
    <div>
      <label>Rep</label>
      <input v-model="menu.rep" type="text" />
    </div>
    <div>
      <label>Set</label>
      <input v-model="menu.set" type="text" />
    </div>
    <div>
      <label>Weight</label>
      <input v-model="menu.weight" type="text" />
    </div>
    <div>
      <label>Calorie</label>
      <input v-model="menu.calorie" type="text" />
    </div>
    <button type="submit">Commit</button>
  </form>
</template>

  <script>
export default {
  props: {
    menu: {},
    errors: ""
  }
};
</script>

<style scoped>
input {
  margin-top: 5px;
  margin-bottom: 5px;
  display: inline-block;
  *display: inline;
  zoom: 1;
  vertical-align: middle;
  margin-left: 20px;
}
/* textarea {
  outline: none;
  border: 1px solid #aaa;
  -webkit-transition: all 0.3s;
  transition: all 0.3s;
} */
input[type="text"]:focus,
textarea:focus {
  box-shadow: 0 0 7px #1abc9c;
  border: 1px solid #1abc9c;
}
label {
  position: relative;
  display: inline-block;
  padding: 3px 3px 3px 22px;
  cursor: pointer;
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
  width: 70px;
  text-align: right;
  font-family: "ＭＳ ゴシック", sans-serif;
  font-size: 14px;
  font-weight: bold;
}

button {
  /* -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  border: 0;
  border-radius: 0;
  background: #cd5c5c;
  color: white;
  font-size: 16px; */
  position: relative;
  display: inline-block;
  padding: 0.25em 0.5em;
  text-decoration: none;
  color: #03a9f4;
  background: white; /*色*/
  border: solid 1px#ddd; /*線色*/
  border-radius: 4px;
  /* box-shadow: inset 0 1px 0 #ddd; */
  text-shadow: 0 1px 0 #fff;
  font-size: 15px;
}

button:hover {
  border: solid 1px #03a9f4;
  box-shadow: none;
  text-shadow: none;
}
button:focus {
  outline: none;
  /* box-shadow: 0 0 0 4px #cbd6ee; */
}
</style>
