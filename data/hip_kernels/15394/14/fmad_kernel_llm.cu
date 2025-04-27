#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fmad_kernel(double x, double y, double *out)
{
    // Use thread-independent calculation to avoid threadIdx check
    if (threadIdx.x == 0 && blockIdx.x == 0)
    {
        *out = __fma_rn(x, x, y);  // Using fused multiply-add operation for precision
    }
}