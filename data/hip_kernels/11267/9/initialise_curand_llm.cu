#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel to reduce unnecessary synchronization and improve parallel execution
__global__ void initialise_curand(hiprandState * state, unsigned long seed)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate unique thread index
    hiprand_init(seed, idx, 0, &state[idx]); // Initialize the PRNG state without synchronization
}