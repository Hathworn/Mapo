#include "hip/hip_runtime.h"
#include "includes.h"

#define max(a, b) a > b ? a : b
#define min(a, b) a < b ? a : b

struct Edge{
    long long int x;
};

__global__ void accumulate(Edge* edge_list, bool* cross_edges, int* indices, int e) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure no overwriting occurs in parallel writing
    if (id < e && cross_edges[id]) {
        Edge temp = edge_list[id];
        atomicExch(&edge_list[indices[id]].x, temp.x);
    }
}