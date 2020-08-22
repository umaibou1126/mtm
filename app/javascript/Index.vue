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

    <div v-if="errors.length !=0">
      <ul v-for="e in errors" :key="e">
        <li>
          <font color="red">{{ e }}</font>
        </li>
      </ul>
    </div>
    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>Discipline</th>
          <th>Rep</th>
          <th>Set</th>
          <th>Weight</th>
          <th>Calorie</th>
          <th>Delete</th>
        </tr>
        <tr v-for="e in menu" :key="e.id">
          <td>
            <router-link :to="{ name: 'Detail', params: { id: e.id } }">{{ e.id }}</router-link>
          </td>
          <td>{{ e.discipline }}</td>
          <td>{{ e.rep }}</td>
          <td>{{ e.set }}</td>
          <td>{{ e.weight }}</td>
          <td>{{ e.calorie }}</td>
          <td>
            <button @click="deleteTarget = e.id; showModal = true">削除</button>
          </td>
          <!-- <button v-on:click="increment">LGTM</button>
          </td>-->
          <!-- <td>
            <router-link :to="{ name: 'Edit', params: { id: e.id } }">Edit</router-link>
          </td>
          <td>
            <router-link :to="{ name: 'New', params: { id: e.id } }">New</router-link>
          </td>-->
        </tr>
      </tbody>
    </table>
    <modal v-if="showModal" @cancel="showModal = false" @ok="deletemenu(); showModal = false;">
      <div slot="body">削除してよろしいですか？</div>
    </modal>
  </div>
</template>

<script>
import axios from "axios";
import Modal from "Modal.vue";
import Detail from "Detail.vue";
import Edit from "Edit.vue";
import New from "New.vue";
export default {
  components: {
    Modal,
    Detail,
    Edit,
    New
  },
  data: function() {
    return {
      menu: [],
      showModal: false,
      deleteTarget: -1,
      errors: ""
    };
  },

  mounted() {
    this.updatemenu();
  },
  methods: {
    increment() {
      this.$store.commit("increment", 1);
    },
    deletemenu: function() {
      if (this.deleteTarget <= 0) {
        console.warn("deleteTarget should be grater than zero.");
        return;
      }
      axios
        .delete(`/api/v1/menu/${this.deleteTarget}`)
        .then(response => {
          this.deleteTarget = -1;
          this.updatemenu();
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    },
    updatemenu: function() {
      axios
        .get("/api/v1/menu.json")
        .then(response => (this.menu = response.data));
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

table {
  width: 100%;
  border-collapse: collapse;
}

table tr {
  border-bottom: solid 1px #ccc;
}

table tr:nth-child(even) {
  background: white;
}
table tr:nth-child(odd) {
  background: #eee;
}

table tr:last-child {
  border-bottom: none;
}
table th {
  position: relative;
  text-align: left;
  width: 5%;
  background-color: black;
  /* background-color: #33cc66; */
  color: white;
  text-align: center;
  padding: 10px 0;
  font-family: "ＭＳ ゴシック", sans-serif;
  font-size: 14px;
}

table td {
  text-align: left;
  width: 5%;
  text-align: center;
  /* background-color: #eeffff; */
  padding: 10px 0;
  color: black;
  /* font-weight: bold; */
  font-family: "ＭＳ ゴシック", sans-serif;
  font-size: 14px;
}

button {
  /* -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  border: 0;
  border-radius: 0;
  background: #cd5c5c;
  color: white;
  font-size: 16px; */
  position: relative;
  display: inline-block;
  padding: 0.25em 0.5em;
  text-decoration: none;
  color: #ff3366;
  background: white; /*色*/
  border: solid 1px#ddd; /*線色*/
  border-radius: 4px;
  /* box-shadow: inset 0 1px 0 #ddd; */
  text-shadow: 0 1px 0 #fff;
  font-size: 15px;
}

button:hover {
  border: solid 1px #03a9f4;
  box-shadow: none;
  text-shadow: none;
}
button:focus {
  outline: none;
  /* box-shadow: 0 0 0 4px #cbd6ee; */
}
</style>

