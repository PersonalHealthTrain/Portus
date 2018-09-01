<script>
  import RespositoriesService from '../../services/repositories';

  export default {
    methods: {
      close() {
        this.$emit('close');
      },
      onSubmit() {
        // Disable button to prevent resubmit in the UI
        document.getElementById('create-tag-submit').disabled = true;

        this.update.old = this.currentTag[0].name;
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
      currentTag: Array,
      repository: Object,
    },
  };
</script>

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

<style scoped>
  .modal-mask {
    position: fixed;
    z-index: 9998;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, .5);
    display: table;
    transition: opacity .3s ease;
  }

  .modal-wrapper {
    display: table-cell;
    vertical-align: middle;
  }

  .modal-container {
    width: 300px;
    margin: 0px auto;
    padding: 20px 30px;
    background-color: #fff;
    border-radius: 2px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, .33);
    transition: all .3s ease;
    font-family: Helvetica, Arial, sans-serif;
  }

  .modal-header h3 {
    margin-top: 0;
    color: #42b983;
  }

  .modal-body {
    margin: 20px 0;
  }

  .modal-default-button {
    float: right;
  }

  /*
   * The following styles are auto-applied to elements with
   * transition="modal" when their visibility is toggled
   * by Vue.js.
   *
   * You can easily play with the modal transition by editing
   * these styles.
   */
  .modal-enter {
    opacity: 0;
  }

  .modal-leave-active {
    opacity: 0;
  }

  .modal-enter .modal-container,
  .modal-leave-active .modal-container {
    -webkit-transform: scale(1.1);
    transform: scale(1.1);
  }
</style>
