#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generate_sources(hiprandState *state, int n, uint32_t *verts) {
    // Calculate unique global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    if (id < n) {
        // Use local state for generating random numbers
        hiprandState local_state = state[id];
        for (int idx = id; idx < n; idx += stride) {
            verts[idx] = hiprand(&local_state);
        }
        // Update global state
        state[id] = local_state;
    }
}