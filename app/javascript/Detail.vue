<template>
  <div class="title">
    <header>
      <nav>
        <ul>
          <li>
            <a>
              <router-link to="/" class="link">トレーニング一覧</router-link>
            </a>
          </li>

          <li>
            <a>
              <router-link :to="{ name: 'Edit', params: { id: menu.id } }">トレーニング編集</router-link>
            </a>
          </li>

          <li>
            <a>
              <router-link to="/menu/new" class="link">トレーニング新規登録</router-link>
            </a>
          </li>
        </ul>
      </nav>
    </header>

    <dl>
      <dt>ID</dt>
      <dd>{{ menu.id }}</dd>
      <dt>種目</dt>
      <dd>{{ menu.discipline }}</dd>
      <dt>レップ数</dt>
      <dd>{{ menu.rep }}</dd>
      <dt>セット</dt>
      <dd>{{ menu.set }}</dd>
      <dt>重量</dt>
      <dd>{{ menu.weight }}</dd>
      <dt>消費カロリー</dt>
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

dl {
  width: 100%;
  overflow: hidden;
  border: 1px solid #ccc;
  border-top: none;
  background: #ddd;
}

dt {
  width: 30%;
  float: left;
  padding: 10px;
  border-top: 1px solid #ccc;
  box-sizing: border-box;
  font-family: "ＭＳ ゴシック", sans-serif;
  font-size: 14px;
}

dd {
  margin-left: 30%;
  padding: 10px;
  border-left: 1px solid #ccc;
  border-top: 1px solid #ccc;
  background: #fff;
  font-family: "ＭＳ ゴシック", sans-serif;
  font-size: 14px;
}
</style>
