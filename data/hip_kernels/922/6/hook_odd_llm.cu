#include "hip/hip_runtime.h"
#include "includes.h"

#define max(a, b) ((a) > (b) ? (a) : (b))
#define min(a, b) ((a) < (b) ? (a) : (b))

struct Edge {
    long long int x;
};

__global__ void hook_odd(int* parent, Edge* edge_list, int e, bool* flag, bool* active_edges){
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Declare shared block flag with initial false
    __shared__ bool block_flag;
    if (threadIdx.x == 0) block_flag = false;
    __syncthreads();

    // Process active edges only
    if (id < e && active_edges[id]) {
        long long int x = edge_list[id].x;
        int v = (int) x & 0xFFFFFFFF;
        int u = (int) (x >> 32);

        int parent_u = parent[u];
        int parent_v = parent[v];

        // Use min and max functions directly for simplicity
        int mx = max(parent_u, parent_v);
        int mn = parent_u + parent_v - mx;

        // Update active status and flag if necessary
        if (parent_u == parent_v) {
            active_edges[id] = false;
        } else {
            parent[mx] = mn;
            block_flag = true;
        }
    }
    __syncthreads();

    // Update the global flag only once per block
    if (threadIdx.x == 0 && block_flag) {
        *flag = true;
    }
}