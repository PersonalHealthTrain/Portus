<template>
  <div>
    <table class="table table-striped table-hover no-margin">
      <colgroup>
        <col width="10" v-if="canDestroy">
        <col class="col-45">
        <col class="col-20">
        <col class="col-10">
        <col class="col-15">
        <col class="col-10" v-if="securityEnabled">
      </colgroup>
      <thead>
        <tr>
          <th v-if="canDestroy"></th>
          <th>Tag</th>
          <th>Author</th>
          <th>Image</th>
          <th>Pushed at</th>
          <th>Action</th>
          <th v-if="securityEnabled">Security</th>
        </tr>
      </thead>
      <tbody>
        <tag-row
          v-for="tag in filteredTags"
          :show-modal="showModal.bind(this, tag)"
          :key="tag[0].digest"
          :tag="tag"
          :can-destroy="canDestroy"
          :security-enabled="securityEnabled"
          :state="state"
          :tags-path="tagsPath"
          :repository="repository">
        </tag-row>
      </tbody>
    </table>
    <table-pagination :total.sync="tags.length" :current-page="currentPage" :itens-per-page.sync="limit" @update="updateCurrentPage"></table-pagination>

    <!-- Modals -->
    <print-summary-modal :close-modal="closeModal" :tag="modalTag" v-if="modalState == 'print-summary'"></print-summary-modal>

    <!-- <create-tag-modal v-if="modalState == 'create-tag'"></create-tag-modal> -->

  </div>
</template>

<script>
  import TablePaginatedMixin from '~/shared/mixins/table-paginated';

  import TagRow from './tags-table-row';

  import CreateTagModal from './modal/create-tag-modal';

  import PrintSummaryModal from './modal/print-summary-modal';

  export default {
    props: {
      tags: Array,
      canDestroy: Boolean,
      securityEnabled: Boolean,
      state: Object,
      tagsPath: String,
      repository: Object,
    },
    data() {
      return {
        modalState: null, // Either: null, 'create-tag', 'print-summary'
        modalTag: null, // The tag object that the current modal refers to
      };
    },
    methods: {
      showModal(modalTag, modalState) {
        this.modalTag = modalTag;
        this.modalState = modalState;
      },
      closeModal() {
        this.modalTag = null;
        this.modalState = null;
      },
    },
    mixins: [TablePaginatedMixin],

    components: {
      TagRow,
      CreateTagModal,
      PrintSummaryModal,
    },
    computed: {
      filteredTags() {
        return this.tags.slice(this.offset, this.limit * this.currentPage);
      },
    },
  };
</script>
