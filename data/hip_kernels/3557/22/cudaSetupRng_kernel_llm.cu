#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSetupRng_kernel(hiprandState *state, unsigned int seed)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Use blockStride loop to handle more threads than available
    int totalThreads = gridDim.x * blockDim.x;
    for (int i = id; i < totalThreads; i += totalThreads)
    {
        // Initialize the RNG state for each thread
        hiprand_init(seed, i, 0, &state[i]);
    }
}