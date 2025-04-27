#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generate_destinations(hiprandState *state, int n, const uint32_t *sources, uint32_t *destinations) {
    int first = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Cache the state of the first thread
    hiprandState local_state = state[first];
    for (int id = first; id < n; id += stride) {
        // Use modulo operation directly on n for better randomness scope
        destinations[id] = sources[hiprand(&local_state) % n];
    }

    // Save the updated state back to global memory
    state[first] = local_state;
}