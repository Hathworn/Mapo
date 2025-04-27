#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generate_sources(hiprandState *state, int n, uint32_t *verts) {
    int first = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Use one thread to check out of bounds and return early
    if (first >= n) return;

    hiprandState local_state = state[first];

    // Iterate while ensuring we do not go beyond bounds
    for (int id = first; id < n; id += stride) {
        verts[id] = hiprand(&local_state);
    }
    
    // Save the local state back to global memory
    state[first] = local_state;
}