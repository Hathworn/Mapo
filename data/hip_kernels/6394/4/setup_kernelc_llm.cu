#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void setup_kernelc ( hiprandState *state, unsigned long seed )
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x; // Calculate unique index for each thread
    hiprand_init(seed, idx, 0, &state[idx]); // Initialize RNG state for each thread
}