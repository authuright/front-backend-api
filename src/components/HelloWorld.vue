<template>
  <div class="hello">
    <h1>{{ userData }}</h1>
    <h4>{{ userData }}</h4>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "HelloWorld",
  data() {
    return {
      userData: null,
    };
  },
  mounted() {
    // Fetch data from the URL
    axios
      .get("http://127.0.0.1:5000/admin")
      .then((response) => {
        // Handle the response data
        this.userData = response.data;
      })
      .catch((error) => {
        console.error("Error fetching data:", error);
      });
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
