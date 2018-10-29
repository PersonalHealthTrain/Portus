<template>
  <transition name="modal">
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div class="modal-container">

          <form id="create-tag-form" class="form-horizontal" role='form' ref="form" @submit.prevent="onSubmit" novalidate>

          <div class="modal-header"><h4>Create a new Tag</h4></div>
          <div class="modal-body">
            <input
              type="text"
              class="form-control"
              placeholder="New Tags's name"
              v-model.trim="update.new" required />
          </div>

          <div class="modal-footer">
            <button
              type="submit"
              class="btn btn-primary"
              id="create-tag-submit"
              @submit.prevent="onSubmit">Create
            </button>
          </div>
          </form>
        </div>
      </div>
    </div>
  </transition>
</template>
<script>
  import RespositoriesService from '../../../services/repositories';

  export default {
    methods: {
      close() {
        this.$emit('close');
      },
      onSubmit() {
        // Disable button to prevent resubmit in the UI
        document.getElementById('create-tag-submit').disabled = true;

        this.update.old = this.modalTag[0].name;
        RespositoriesService.createNewTag(this.repository.id, this.update).then(() => {
          document.getElementById('create-tag-submit').disabled = false;
          this.$emit('close');
        });
      },
    },
    data() {
      return {
        update: {
          old: '',
          new: '',
        },
      };
    },
    props: {
      modalTag: Array,
      repository: Object,
    },
  };
</script>
