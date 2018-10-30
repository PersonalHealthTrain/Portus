<template>
  <div class="repositories-index-page">

    <new-repository-form form-state="newFormVisible" ></new-repository-form>
    <repositories-panel title="Repositories via team membership" :repositories="teamRepositories" :repositories-path="repositoriesPath" :namespaces-path="namespacesPath"></repositories-panel>
    <repositories-panel title="Other repositories" :repositories="otherRepositories" :repositories-path="repositoriesPath" :namespaces-path="namespacesPath" v-if="otherRepositories.length > 0"></repositories-panel>
  </div>
</template>

<script>
  import RepositoriesPanel from '../components/panel';
  import NewRepositoryForm from '../components/new-form';

  export default {
    props: {
      teamRepositoriesRef: {
        type: Array,
      },
      otherRepositoriesRef: {
        type: Array,
      },
      repositoriesPath: {
        type: String,
      },
      namespacesPath: {
        type: String,
      },
    },

    components: {
      RepositoriesPanel,
      NewRepositoryForm,
    },

    data() {
      return {
        teamRepositories: [...this.teamRepositoriesRef],
        otherRepositories: [...this.otherRepositoriesRef],
      };
    },
  };
</script>
