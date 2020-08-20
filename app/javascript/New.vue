<template>
  <div class="new">
    <Pane :errors="errors" :menu="menu" @submit="createmenu"></Pane>
  </div>
</template>


<script>
import axios from "axios";
import Pane from "Pane.vue";
export default {
  components: {
    Pane
  },
  data() {
    return {
      menu: {
        discipline: "",
        rep: "",
        set: "",
        weight: "",
        calorie: ""
      },
      errors: ""
    };
  },
  methods: {
    createmenu: function() {
      axios
        .post("/api/v1/menu", this.menu)
        .then(response => {
          let e = response.data;
          this.$router.push({ name: "Detail", params: { id: e.id } });
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    }
  }
};
</script>

<style scoped>
</style>
