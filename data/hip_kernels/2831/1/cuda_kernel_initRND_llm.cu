#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_kernel_initRND(unsigned long seed, hiprandState *States)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Use blockDim.x for better scalability
    hiprand_init(seed, id, 0, &States[id]); // Directly use 'id' for initialization
}