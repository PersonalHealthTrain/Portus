<template>
  <div class="table-responsive">
    <table class="table table-striped table-hover">
      <colgroup>
        <col class="col-60">
      </colgroup>
      <thead>
        <tr>
          <th>
            Station ID
          </th>
          <th>
            Station Name
          </th>
        </tr>
      </thead>
      <tbody>
        <station-table-row
          v-for="station in stations"
          :key="station.id"
          :station="station">
        </station-table-row>
      </tbody>
    </table>

    <!--<table-pagination :total.sync="repositories.length" :current-page="currentPage" :itens-per-page.sync="limit" @update="updateCurrentPage"></table-pagination>-->
  </div>
</template>

<script>

  import StationTableRow from './table-row';

  export default {
    props: {
      prefix: {
        type: String,
        default: '',
      },
      stations: {
        type: Array,
      },
    },

    components: {
      StationTableRow,
    },

    computed: {
    },
  };
</script>
