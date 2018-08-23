import Vue from 'vue';
//
// import RepositoriesIndexPage from './pages/index';
// import RepositoriesShowPage from './pages/show';

$(() => {
  if (!$('body[data-controller="stations"]').length) {
    return;
  }

  // eslint-disable-next-line no-new
  new Vue({
    el: '.vue-root',

    components: {
    },
  });
});
