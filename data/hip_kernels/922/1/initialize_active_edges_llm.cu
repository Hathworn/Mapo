#include "hip/hip_runtime.h"
#include "includes.h"

#define max(a, b) a > b ? a : b
#define min(a, b) a < b ? a : b

struct Edge{
    long long int x;
};

__global__ void initialize_active_edges(bool* active_edges, int e) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Check within bounds and set each edge as active
    if (id < e) {
        active_edges[id] = true;
    }
}