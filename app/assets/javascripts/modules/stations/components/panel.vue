<template>
  <panel class="stations-panel">
    <h5 slot="heading-left">
      {{ title }}
    </h5>

    <div slot="heading-right">
      <slot name="heading-right"></slot>
    </div>

    <div slot="body">
      <stations-table :stations="stations"></stations-table>
    </div>
  </panel>
</template>

<script>
  import StationsTable from './table';

  export default {
    props: {
      title: {
        type: String,
        default: 'Stations',
      },
      stations: {
        type: Array,
      },
    },
    components: {
      StationsTable,
    },
  };
</script>
