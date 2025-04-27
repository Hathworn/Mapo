#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_debug_kernel()
{
    // No thread or data operations are specified, 
    // therefore no further optimizations can be applied to the kernel as it stands.
}