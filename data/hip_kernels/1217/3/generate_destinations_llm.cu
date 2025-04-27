#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void generate_destinations(hiprandState *state, int n, const uint32_t *sources, uint32_t *destinations)
{
    int first  = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    if (first < n) { // Ensure the first index is within bounds
        hiprandState local_state = state[first];
        for (int id = first; id < n; id += stride) {
            destinations[id] = sources[hiprand(&local_state) % n];
        }
        state[first] = local_state;
    }
}