<template id="mytmp">

<div>
  <div id="mynetwork"></div>
  <div>{{ refresh }}</div>
</div>

</template>

<script>
  import vis from 'vis';

  export default {
    template: '#mytmp',
    name: 'route-panel',

    props: {
      tags: [Array],
    },
    data() {
      return {
        network: null,
      };
    },

    computed: {
      refresh() {
        if (this.tags.length === 0 || this.network !== null) {
          return '';
        }
        // Compute the nodes
        const nodes = this.tags.map((x) => {
          const node = x[0];
          return {
            id: node.id,
            name: node.name,
            created_at: new Date(node.created_at).getTime(),
          };
        }).sort((a, b) => a.created_at - b.created_at);
        // compute edges
        const edges = Array.from(new Array(this.tags.length - 1), (_, i) => i)
          .map((i) => {
            return {
              from: nodes[i].id,
              to: nodes[i + 1].id,
            };
          });
        const options = {};
        this.network = new vis.Network(document.getElementById('mynetwork'), {
          nodes: nodes.map((x) => {
            return { id: x.id, name: x.name };
          }),
          edges: edges,
        }, options);
        return '';
      },
    },
  };
</script>

<style scoped>
  #mynetwork {
    height: 800px;
    border: 1px solid lightgray;
  }
</style>
