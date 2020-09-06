<template>
  <div>
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
              <router-link to="/menu/new" class="link">トレーニング新規登録</router-link>
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

    <div class="form">
      <form class="col" @submit.prevent="signin">
        <div class="text-red" v-if="error">{{ error }}</div>
        <div class="text-input">
          <input
            placeholder="Email"
            type="text"
            class="validate"
            v-model="email"
            required="required"
          />
          <span class="separator"></span>
        </div>
        <div class="text-input">
          <input
            placeholder="Password"
            type="text"
            class="validate"
            v-model="password"
            required="required"
          />
          <span class="separator"></span>
        </div>

        <button type="submit">ログイン</button>
      </form>
    </div>
  </div>
</template>

<script>
import axios from "axios";
//　動作は，Signupコンポーネントと同じ。
export default {
  name: "Signin",
  data() {
    return {
      email: "",
      password: "",
      error: ""
    };
  },
  created() {
    this.checkSignedIn();
  },
  updated() {
    this.checkSignedIn();
  },
  methods: {
    signin() {
      this.$http.plain
        .post("/api/signin", { email: this.email, password: this.password })
        .then(response => this.signinSuccessful(response))
        .catch(error => this.signinFailed(error));
    },
    signinSuccessful(response) {
      if (!response.data.csrf) {
        this.signinFailed(response);
        return;
      }
      localStorage.csrf = response.data.csrf;
      localStorage.signedIn = true;
      this.$store.dispatch("doFetchSignedIn");
      this.error = "";
      this.$router.replace("/");
    },
    signinFailed(error) {
      this.error =
        (error.response && error.response.data && error.response.data.error) ||
        "";
      delete localStorage.csrf;
      delete localStorage.signedIn;
    },
    checkSignedIn() {
      if (localStorage.signedIn) {
        this.$router.replace("/");
      }
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

.form {
  width: 400px;
  margin: 0 auto;
  text-align: left;
  margin-top: 10em;
}

.form form .text-input {
  overflow: hidden;
  margin-bottom: 0.875em;
}

.form form input {
  width: 100%;
  padding: 1em 0 12px;
  padding-left: 0;
  background: none;
  color: black;
  font-size: 1.2em;
  font-weight: 400;
  border: none;
  border-bottom: 1px solid #999;
}

.form form input:focus + .separator {
  transform: scaleX(1) translateY(-2px);
  opacity: 1;
}

.separator {
  height: 3px;
  width: 100%;
  background: #3599ff;
  display: block;
  transform: scaleX(0) translateY(-2px);
  transform-origin: 50%;
  opacity: 0;
  transition: all 0.15s linear;
}

.separator:focus {
  outline-color: transparent;
  outline-style: none;
}

.form form button {
  background: #b5cd60;
  border: 0;
  width: 100%;
  height: 40px;
  border-radius: 3px;
  color: white;
  cursor: pointer;
  /* transition: background 0.3s ease-in-out; */
}

.form form button:hover {
  background: #16aa56;
}
</style>
