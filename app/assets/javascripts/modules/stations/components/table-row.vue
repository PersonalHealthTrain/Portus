<template>
  <tr>
    <td>
      {{ station.station_id}}
    </td>
  </tr>
</template>

<script>

  export default {
    template: '#js-station-table-row-tmpl',

    props: ['station'],

    computed: {
    },
  };
</script>
