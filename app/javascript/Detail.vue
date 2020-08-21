<template>
  <div class="title">
    <header>
      <nav>
        <ul>
          <li>
            <a>
              <router-link to="/" class="link">Index</router-link>
            </a>
          </li>

          <li>
            <a>
              <router-link :to="{ name: 'Edit', params: { id: menu.id } }">Edit</router-link>
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

    <dl>
      <dt>ID</dt>
      <dd>{{ menu.id }}</dd>
      <dt>Discipline</dt>
      <dd>{{ menu.discipline }}</dd>
      <dt>Rep</dt>
      <dd>{{ menu.rep }}</dd>
      <dt>Set</dt>
      <dd>{{ menu.set }}</dd>
      <dt>Weight</dt>
      <dd>{{ menu.weight }}</dd>
      <dt>Calorie</dt>
      <dd>{{ menu.calorie }}</dd>
    </dl>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data: function() {
    return {
      menu: {}
    };
  },
  computed: {
    likeNumber() {
      return this.$store.state.likeNumber;
    }
  },
  mounted() {
    axios
      .get(`/api/v1/menu/${this.$route.params.id}.json`)
      .then(response => (this.menu = response.data));
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
