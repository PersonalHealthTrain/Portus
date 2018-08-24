import Vue from 'vue';

import StationsIndexPage from './pages/index';

$(() => {
  // if (!$('body[data-controller="stations"]').length) {
  //   return;
  // }

  // eslint-disable-next-line no-new
  new Vue({
    el: '.vue-root',

    components: {
      StationsIndexPage,
    },
  });
});
