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
              <router-link to="/signin" class="link">会員ログイン</router-link>
            </a>
          </li>
          <li>
            <a>
              <router-link to="/signup" class="link">新規会員登録</router-link>
            </a>
          </li>
        </ul>
      </nav>
    </header>
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
nav ul {
  display: table;
  width: 100%;
  text-align: center;
  border-collapse: collapse;
  border-spacing: 0;
  justify-content: space-between;
}
nav ul li {
  display: table-cell;
  width: 33.3%;
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
