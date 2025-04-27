#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fmad_kernel(double x, double y, double *out)
{
    // Use only one thread to compute the operation
    if (threadIdx.x == 0 && blockIdx.x == 0)
    {
        *out = __dmul_rd(x, x) + y; // Use multiply-add intrinsic for better performance
    }
}