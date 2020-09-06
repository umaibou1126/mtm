<template>
  <div>
    <header>
      <nav>
        <ul>
          <li>
            <a>
              <router-link to="/" class="link">HOME</router-link>
            </a>
          </li>
          <li>
            <a>
              <router-link to="/menu/new" class="link">New</router-link>
            </a>
          </li>
        </ul>
      </nav>
    </header>
    <Pane :errors="errors" :menu="menu" @submit="updatemenu"></Pane>
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
nav ul {
  display: table;
  width: 100%;
  text-align: center;
  border-collapse: collapse;
  border-spacing: 0;
}
nav ul li {
  display: table-cell;
  min-width: 50px;
  border-right: 1px solid #ccc;
  border-bottom: 5px solid #ccc;
}

nav ul li a {
  display: block;
  width: 100%;
  padding: 10px 0;
  text-decoration: none;
  color: #aaa;
}
nav ul li a:hover {
  color: black;
}
</style>
