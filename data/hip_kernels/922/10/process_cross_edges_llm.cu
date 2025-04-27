#include "hip/hip_runtime.h"
#include "includes.h"

#define max(a, b) ((a) > (b) ? (a) : (b))
#define min(a, b) ((a) < (b) ? (a) : (b))

struct Edge{
    long long int x;
};

__global__ void process_cross_edges(int* parent, Edge* edge_list, int e, bool* flag, bool* cross_edges) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    __shared__ bool block_flag;
    
    if (threadIdx.x == 0) {
        block_flag = false; // Initialize block shared flag
    }
    __syncthreads();

    if (id < e && cross_edges[id]) {
        long long int x = edge_list[id].x;
        int v = (int)x & 0xFFFFFFFF;
        int u = (int)(x >> 32);

        int parent_u = parent[u];
        int parent_v = parent[v];

        if (parent_u != parent_v) { // Check if nodes have different parents
            int mn = min(parent_u, parent_v);
            int mx = max(parent_u, parent_v);
            parent[mx] = mn; // Union operation
            block_flag = true; // Set block flag if union occurs
        } else {
            cross_edges[id] = false;
        }
    }
    __syncthreads();

    if (threadIdx.x == 0 && block_flag) {
        *flag = true; // If any union occurred, set global flag
    }
}