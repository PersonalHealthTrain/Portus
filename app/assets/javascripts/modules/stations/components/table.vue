<template>
  <div class="table-responsive">
    <table class="table table-striped table-hover" :class="{'table-sortable': sortable}">
      <colgroup>
        <col class="col-60">
      </colgroup>
      <thead>
        <tr>
          <th @click="sort('name')">
            <i class="fa fa-fw fa-sort" :class="{
              'fa-sort-amount-asc': sorting.by === 'name' && sorting.asc,
              'fa-sort-amount-desc': sorting.by === 'name' && !sorting.asc,
            }"></i>
            Station ID
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
  import TableSortableMixin from '~/shared/mixins/table-sortable';
  import TablePaginatedMixin from '~/shared/mixins/table-paginated';

  import StationTableRow from './table-row';

  export default {
    props: {
      prefix: {
        type: String,
        default: '',
      },
    },

    mixins: [TableSortableMixin, TablePaginatedMixin],

    components: {
      StationTableRow,
    },

    computed: {
    },
  };
</script>
