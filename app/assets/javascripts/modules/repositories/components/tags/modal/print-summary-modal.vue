<template>
<tag-modal @close="closeModal" :tag="tag" title="Train Arrival Summary">

  <!-- TODO Mock content -->
  <table class="table table-striped table-hover no-margin">
    <thead>
    <tr>
      <th>Parameter</th>
      <th>Value</th>
    </tr>
    </thead>
    <tbody>
    <tr><td>Alpha</td><td>{{ alpha  }}</td></tr>
    <tr><td>Beta</td><td>{{ beta}}</td></tr>
    <tr><td>Gamma</td><td>{{ gamma }}</td></tr>
    </tbody>
  </table>
</tag-modal>
</template>
<script>
  import TagModal from './tag-modal';

  function rand() {
    return Math.random().toFixed(2);
  }
  export default {
    name: 'print-summary-modal',

    components: {
      TagModal,
    },
    props: {
      tag: Array,
      closeModal: Function,
    },
    data() {
      return {
        alpha: rand(),
        beta: rand(),
        gamma: rand(),
      };
    },
  };
</script>
