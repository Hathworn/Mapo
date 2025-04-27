#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nothingKernel()
{
    // Launch check: Ensure no threads execute the kernel if not needed
    if (blockIdx.x * blockDim.x + threadIdx.x >= 1) return;

    // No operations required in this kernel
}