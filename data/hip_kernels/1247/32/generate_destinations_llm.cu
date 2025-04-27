#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generate_destinations(hiprandState *state, int n, const uint32_t *sources, uint32_t *destinations) {
    int first = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Use shared memory to reduce access time for state
    __shared__ hiprandState shared_state;
    if (threadIdx.x == 0) {
        shared_state = state[first];
    }
    __syncthreads();
    hiprandState local_state = shared_state;

    // Loop unrolling for efficiency
    for (int id = first; id < n; id += stride * 4) {
        destinations[id] = sources[hiprand(&local_state) % n];
        if (id + stride < n) {
            destinations[id + stride] = sources[hiprand(&local_state) % n];
        }
        if (id + stride * 2 < n) {
            destinations[id + stride * 2] = sources[hiprand(&local_state) % n];
        }
        if (id + stride * 3 < n) {
            destinations[id + stride * 3] = sources[hiprand(&local_state) % n];
        }
    }

    // Restore updated state back to global memory
    if (threadIdx.x == 0) {
        state[first] = local_state;
    }
}