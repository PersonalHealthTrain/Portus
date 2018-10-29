<template>
  <button
    type="button"
    class="btn"
    v-on:click="$emit('action')">
    <i class="fa" v-bind:class="icon"></i>
  </button>
</template>

<script>
  export default {
    name: 'tag-action-button',
    props: {
      icon: String,
    },
  };
</script>
