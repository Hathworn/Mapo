#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generate_sources(hiprandState *state, int n, uint32_t *verts) {
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    if (id < n) {
        // Improved memory locality by keeping local state in register
        hiprandState local_state = state[id];
        
        // Using persistent threads to ensure no out-of-bounds access
        do {
            verts[id] = hiprand(&local_state);
            id += stride;
        } while (id < n);

        // Restore the state at the original position
        state[threadIdx.x + blockIdx.x * blockDim.x] = local_state;
    }
}