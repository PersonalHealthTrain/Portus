<template>
  <tr>
    <td>
      {{ station.station_id}}
    </td>
    <td>
      {{ station.display_name }}
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
