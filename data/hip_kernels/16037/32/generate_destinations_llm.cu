#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generate_destinations(hiprandState *state, int n, const uint32_t *sources, uint32_t *destinations) {
    int first = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Load state into a local variable for increased performance
    hiprandState local_state = state[first];

    // Process each element using the thread's stride for better memory access
    for (int id = first; id < n; id += stride) {
        // Generate a random index and access `sources` array
        destinations[id] = sources[hiprand(&local_state) % n];
    }

    // Store the updated state back to global memory
    state[first] = local_state;
}