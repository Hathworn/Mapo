#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generate_sources(hiprandState *state, int n, uint32_t *verts) {
    int first = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Initialize local random state
    hiprandState local_state = state[first];

    // Unroll loop for better performance
    for (int id = first; id < n; id += stride * 4) {
        if (id < n) {
            verts[id] = hiprand(&local_state);
        }
        if (id + stride < n) {
            verts[id + stride] = hiprand(&local_state);
        }
        if (id + 2 * stride < n) {
            verts[id + 2 * stride] = hiprand(&local_state);
        }
        if (id + 3 * stride < n) {
            verts[id + 3 * stride] = hiprand(&local_state);
        }
    }

    // Store local random state back to global state
    state[first] = local_state;
}