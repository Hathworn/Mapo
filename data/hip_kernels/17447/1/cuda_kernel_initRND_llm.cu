#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_kernel_initRND(unsigned long seed, hiprandState *States)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified id calculation
    int pixel = id; // Direct mapping to id
    hiprand_init(seed, pixel, 0, &States[id]); // Initialize random state
}