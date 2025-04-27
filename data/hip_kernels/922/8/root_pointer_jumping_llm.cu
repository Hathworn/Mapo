```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define max(a, b) a > b ? a : b
#define min(a, b) a < b ? a : b

struct Edge{
long long int x;
};

__global__ void root_pointer_jumping(int* parent, int* vertex_state, int n, bool* flag) {
    int bid = blockIdx.x;
    int tid = threadIdx.x;
    int id = bid * blockDim.x + tid;
    int parent_id, grandparent_id;
    __shared__ bool block_flag;
    if (tid == 0) block_flag = false;
    __syncthreads();

    if (id < n && vertex_state[id] == 0) {  // Combined two if conditions
        parent_id = parent[id];
        grandparent_id = parent[parent_id];
        if (parent_id != grandparent_id) {
            parent[id] = grandparent_id;
            block_flag = true;
        } else {
            vertex_state[id] = -1;
        }
    }
    
    __syncthreads();  // Ensure all threads update block_flag before any thread writes to global flag

    if (tid == 0 && block_flag) *flag = true;
}