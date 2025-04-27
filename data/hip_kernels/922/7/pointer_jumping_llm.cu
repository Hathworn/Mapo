```cuda
#include "hip/hip_runtime.h"
#include "includes.h"

#define max(a, b) a > b ? a : b
#define min(a, b) a < b ? a : b

struct Edge{
long long int x;
};

__global__ void pointer_jumping(int* parent, int n, bool* flag) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (id < n) {
        int parent_id = parent[id];
        int grandparent_id = parent[parent_id];

        // Use warp-wide operations to reduce the need for __syncthreads()
        bool local_flag = (parent_id != grandparent_id);
        if (local_flag) {
            parent[id] = grandparent_id;
        }

        // Use atomic operations to avoid repeated checks by threads at different warps
        if (local_flag && __syncthreads_or(local_flag)) {
            *flag = true;
        }
    }
}