#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_setup_curand(uint64_t seed, hiprandState *curand_states, uint32_t num_engines) {
uint64_t id =
blockIdx.y * gridDim.x * blockDim.x +
blockIdx.x * blockDim.x +
threadIdx.x;

while(id < num_engines)
{
hiprand_init(id + seed, 0, 0, &curand_states[id]);
id += blockDim.x * gridDim.x + blockDim.y * blockDim.y;
}
}