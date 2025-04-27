#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generate_destinations(hiprandState *state, int n, const uint32_t *sources, uint32_t *destinations) {
    int first = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Use shared memory to store sources
    extern __shared__ uint32_t shared_sources[];
    if (first < n) {
        shared_sources[threadIdx.x] = sources[first];
    }
    __syncthreads();

    hiprandState local_state = state[first];
    for (int id = first; id < n; id += stride) {
        // Access shared memory
        destinations[id] = shared_sources[hiprand(&local_state) % blockDim.x];
    }

    state[first] = local_state;
}