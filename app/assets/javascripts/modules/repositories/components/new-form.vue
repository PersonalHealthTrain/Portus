<template>
  <form id="new-repository-form" class="form-horizontal collapse" role='form' ref="form" @submit.prevent="onSubmit" novalidate>

    <!-- Selection of the base repository -->
    <vue-multiselect
      id="team_user_user"
      :options="options">
      <span slot="noResult">Oops! No username found. Consider changing the search query.</span>
    </vue-multiselect>

  </form>
</template>

<script>
  import FormMixin from '~/shared/mixins/form';
  import VueMultiselect from 'vue-multiselect';

  export default {
    mixins: [FormMixin],
    components: {
      VueMultiselect,
    },
    data() {
      return {
        options: ['train_base_1', 'train_base_2'],
      };
    },
  };
</script>
