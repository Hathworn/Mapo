#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void generate_sources(hiprandState *state, int n, uint32_t *verts) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    if (idx < n) { // Check bounds before processing
        hiprandState local_state = state[idx];
        for (int id = idx; id < n; id += stride) {
            verts[id] = hiprand(&local_state);
        }
        state[idx] = local_state;
    }
}