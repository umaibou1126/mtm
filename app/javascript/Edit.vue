<template>
  <Pane :errors="errors" :menu="menu" @submit="updatemenu"></Pane>
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
      menu: {},
      errors: ""
    };
  },
  mounted() {
    axios
      .get(`/api/v1/menu/${this.$route.params.id}.json`)
      .then(response => (this.menu = response.data));
  },
  methods: {
    updatemenu: function() {
      axios
        .patch(`/api/v1/menu/${this.menu.id}`, this.menu)
        .then(response => {
          this.$router.push({
            name: "Detail",
            params: { id: this.menu.id }
          });
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
