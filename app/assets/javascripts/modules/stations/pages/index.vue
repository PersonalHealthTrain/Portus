<template>
  <div class="stations-index-page">
    <stations-panel title="Registered Stations"></stations-panel>
  </div>
</template>

<script>
  import StationsPanel from '../components/panel';

  export default {
    props: {
      stationsRef: {
        type: Array,
      },
    },

    components: {
      StationsPanel,
    },

    data() {
      return {
        stations: [...this.stationsRef],
      };
    },
  };
</script>
