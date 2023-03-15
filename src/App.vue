<template>
  <button type="button" @click="getItem()">Get a new hacker law</button>
  <div v-if="item != null">
    <h1>{{ item.name }}</h1>
    <p>{{ item.definition }}</p>
  </div>
</template>

<script>
export default {
  name: 'App',
  data() {
    return {
      item: []
    }
  },
  methods: {
    getItem() {
      this.axios.get("/items").then((response) => {
        this.item = response.data
      })
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
