#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel to generate destinations
__global__ void generate_destinations(hiprandState *state, int n, const uint32_t *sources, uint32_t *destinations) {
    int first = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    
    hiprandState local_state = state[first];
    
    for (int id = first; id < n; id += stride) {
        // Reduce modulo operations
        uint32_t random_index = hiprand(&local_state);
        random_index = random_index >= n ? random_index % n : random_index;
        destinations[id] = sources[random_index];
    }

    state[first] = local_state;  // Persist local state
}