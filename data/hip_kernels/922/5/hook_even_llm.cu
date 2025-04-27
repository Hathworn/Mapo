#include "hip/hip_runtime.h"
#include "includes.h"

#define max(a, b) a > b ? a : b
#define min(a, b) a < b ? a : b

struct Edge{
    long long int x;
};

__global__ void hook_even(int* parent, Edge* edge_list, int e, bool* flag, bool* active_edges) {
    int bid = blockIdx.x;
    int tid = threadIdx.x;
    int id = bid * blockDim.x + tid;
    int stride = blockDim.x * gridDim.x;

    // Use shared memory to reduce global memory access frequency
    __shared__ bool block_flag;
    if (tid == 0) block_flag = false;
    __syncthreads();

    for (int i = id; i < e; i += stride) {
        if (active_edges[i]) {
            long long int x = edge_list[i].x;
            int v = (int)x & 0xFFFFFFFF;
            int u = (int)(x >> 32);

            int parent_u = parent[u];
            int parent_v = parent[v];

            int mx = max(parent_u, parent_v);
            int mn = parent_u + parent_v - mx;

            if (parent_u == parent_v) {
                active_edges[i] = false;
            } else {
                parent[mn] = mx;
                block_flag = true;
            }
        }
    }
    __syncthreads();

    if (tid == 0 && block_flag) {
        *flag = true;
    }
}