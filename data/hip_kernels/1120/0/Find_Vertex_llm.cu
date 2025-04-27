#include "hip/hip_runtime.h"
#include "includes.h"

#define V 8
#define E 11
#define MAX_WEIGHT 1000000
#define TRUE    1
#define FALSE   0

typedef int boolean;

typedef struct {
    int u;
    int v;
} Edge;

typedef struct {
    int title;
    boolean visited;
} Vertex;

__device__ __host__ int findEdge(Vertex u, Vertex v, Edge *edges, int *weights) {
    for(int i = 0; i < E; i++) {
        if(edges[i].u == u.title && edges[i].v == v.title) {
            return weights[i];
        }
    }
    return MAX_WEIGHT;
}

__global__ void Find_Vertex(Vertex *vertices, Edge *edges, int *weights, int *length, int *updateLength) {
    int u = blockIdx.x * blockDim.x + threadIdx.x;  // Optimize thread index calculation

    if (u < V && vertices[u].visited == FALSE) {    // Check if u is within bounds
        vertices[u].visited = TRUE;

        for (int v = 0; v < V; v++) {
            int weight = findEdge(vertices[u], vertices[v], edges, weights);

            if (weight < MAX_WEIGHT) {
                atomicMin(&updateLength[v], length[u] + weight);  // Use atomicMin for thread safety
            }
        }
    }
}