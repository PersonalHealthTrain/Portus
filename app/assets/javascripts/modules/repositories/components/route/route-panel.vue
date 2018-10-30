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
        previousNumberOfTags: 0,
        options: {
          edges: {
            arrows: {
              to: {
                enabled: true,
                scaleFactor: 1,
                type: 'arrow',
              },
              middle: {
                enabled: false,
                scaleFactor: 1,
                type: 'arrow',
              },
              from: {
                enabled: false,
                scaleFactor: 1,
                type: 'arrow',
              },
            },
          },
          physics: {
            enabled: false,
          },
        },
      };
    },
    computed: {
      refresh() {
        const numberOfTags = this.tags.length;
        // Number of tags has not changed in this request, so we skip redrawing
        if (numberOfTags === this.previousNumberOfTags) {
          return '';
        }
        this.previousNumberOfTags = numberOfTags;
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
        const edges = Array
          .from(new Array(numberOfTags - 1), (_, i) => i)
          .map(i => ({ from: nodes[i].id, to: nodes[i + 1].id }));
        this.network = new vis.Network(document.getElementById('mynetwork'), {
          nodes: nodes.map((x) => {
            return { id: x.id, label: x.name };
          }),
          edges: edges,
        }, this.options);
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
