#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_setup_curand(uint64_t seed, hiprandState *curand_states, uint32_t num_engines) {
    uint64_t id = blockIdx.y * gridDim.x * blockDim.x + blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure all threads get unique indices within the grid
    uint64_t stride = blockDim.x * gridDim.x;

    // Efficient iteration over engines using grid stride
    while(id < num_engines) {
        hiprand_init(id + seed, 0, 0, &curand_states[id]);
        id += stride;
    }
}