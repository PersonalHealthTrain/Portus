import Vue from 'vue';
import VueResource from 'vue-resource';

Vue.use(VueResource);

const tagsCustomActions = {
  groupedTags: {
    method: 'GET',
    url: 'api/v1/repositories/{repositoryId}/tags/grouped',
  },
  // Method for creating a new Tag via POST
  createNewTag: {
    method: 'POST',
    url: 'api/v1/repositories/{repositoryId}/tags',
  },
};

const repositoryCustomActions = {
  toggleStar: {
    method: 'POST',
    url: 'repositories/{id}/toggle_star.json',
  },
};

const oldResource = Vue.resource('repositories{/id}', {}, repositoryCustomActions);
const resource = Vue.resource('api/v1/repositories{/id}');
const tagsResource = Vue.resource('api/v1/repositories{/repositoryId}/tags', {}, tagsCustomActions);

function get(id) {
  return resource.get({ id });
}

function toggleStar(id) {
  return oldResource.toggleStar({ id }, {});
}

function remove(id) {
  return resource.delete({ id });
}

function groupedTags(repositoryId) {
  return tagsResource.groupedTags({ repositoryId });
}

// function for adding new Tag via the resource
function createNewTag(repositoryId, update) {
  // alert(JSON.stringify(update));
  return tagsResource.createNewTag({ repositoryId }, update);
}


export default {
  get,
  groupedTags,
  createNewTag,
  toggleStar,
  remove,
};
