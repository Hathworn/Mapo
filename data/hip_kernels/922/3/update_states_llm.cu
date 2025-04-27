#include "hip/hip_runtime.h"
#include "includes.h"

#define max(a, b) a > b ? a : b
#define min(a, b) a < b ? a : b

struct Edge{
    long long int x;
};

__global__ void update_states(int* parent, int* vertex_state, int n) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the thread index is within bounds
    if (id < n) {
        // Efficient conditional assignment using ternary operator
        vertex_state[id] = (parent[id] == id) ? 0 : 1;
    }
}