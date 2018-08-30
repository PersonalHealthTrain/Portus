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
          @swim="showModal"
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

    <!-- The Modal for creating new tags from an existing tag -->
    <create-tag-modal
      v-show="isModalVisible"
      :repository="repository"
      :current-tag="currentTag"
      @close="closeModal"
    />
  </div>
</template>

<script>
  import TablePaginatedMixin from '~/shared/mixins/table-paginated';

  import TagRow from './tags-table-row';

  import CreateTagModal from './create/create-tag-modal';

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
        isModalVisible: false,
        currentTag: null,
      };
    },
    methods: {
      showModal(tag) {
        this.currentTag = tag;
        this.isModalVisible = true;
      },
      closeModal() {
        this.isModalVisible = false;
      },
    },
    mixins: [TablePaginatedMixin],

    components: {
      TagRow,
      CreateTagModal,
    },
    computed: {
      filteredTags() {
        return this.tags.slice(this.offset, this.limit * this.currentPage);
      },
    },
  };
</script>
