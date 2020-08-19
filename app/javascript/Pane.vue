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

<style>
</style>
