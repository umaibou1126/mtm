<template>
  <div class="title">
    <header>
      <nav id="gnav">
        <ul class="nav-list">
          <li class="nav-item">
            <router-link to="/" class="link">Index</router-link>
          </li>

          <li class="nav-list-item">
            <router-link :to="{ name: 'Edit', params: { id: menu.id } }">Edit</router-link>
          </li>

          <li class="nav-list-item">
            <router-link to="/menu/new" class="link">New</router-link>
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
      <dt>Calorie</dt>
      <dd>{{ menu.calorie }}</dd>
      <dt>Weight</dt>
      <dd>{{ menu.weight }}</dd>
      <dd>
        <router-link to="/" class="link">Index</router-link>
      </dd>
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
#gnav {
  background-color: gray;
}
#gnav ul {
  overflow: hidden;
}

#gnav li {
  float: left;
  width: 200px;
}
</style>
