#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void generate_sources(hiprandState *state, int n, uint32_t *verts) {
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    // Loop through in a more memory-friendly way
    for (; id < n; id += stride) {
        // Load the state only once per loop iteration
        hiprandState local_state = state[id];
        verts[id] = hiprand(&local_state);
        state[id] = local_state;
    }
}