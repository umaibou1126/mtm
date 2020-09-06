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
    <div class="button">
      <button type="submit">登録</button>
    </div>
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
.button {
  text-align: center;
}

form button {
  background: #b5cd60;
  border: 0;
  width: 40%;
  height: 40px;
  border-radius: 3px;
  color: white;
  cursor: pointer;
  text-align: center;
  /* transition: background 0.3s ease-in-out; */
}

form button:hover {
  background: #16aa56;
}
</style>
