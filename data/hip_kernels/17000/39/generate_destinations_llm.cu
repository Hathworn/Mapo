#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generate_destinations(hiprandState *state, int n, const uint32_t *sources, uint32_t *destinations) {
    int first = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Initialize local state once outside loop for better performance
    hiprandState local_state = state[first];

    // Optimize the loop by calculating destination directly and reduce global memory access
    for (int id = first; id < n; id += stride) {
        // Use modulo operation directly on generated random value
        destinations[id] = sources[hiprand(&local_state) % n];
    }

    // Save the state back to global memory
    state[first] = local_state;
}