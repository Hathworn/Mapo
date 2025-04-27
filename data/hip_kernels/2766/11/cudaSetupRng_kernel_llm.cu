#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSetupRng_kernel(hiprandState * state, unsigned int seed)
{
    // Calculate the global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Initialize RNG with unique sequence for each thread
    hiprand_init(seed, id, 0, &state[id]);
}