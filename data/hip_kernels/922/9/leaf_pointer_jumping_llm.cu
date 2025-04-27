#include "hip/hip_runtime.h"
#include "includes.h"

#define max(a, b) a > b ? a : b
#define min(a, b) a < b ? a : b

struct Edge{
    long long int x;
};

__global__ void leaf_pointer_jumping(int* parent, int* vertex_state, int n) {
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check bounds and vertex state
    if (id < n && vertex_state[id] == 1) {
        // Efficiently update parent pointer
        int parent_id = parent[id];
        parent[id] = parent[parent_id];
    }
}