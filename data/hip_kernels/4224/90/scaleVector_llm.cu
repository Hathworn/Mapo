#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scaleVector(float *d_res, const float *d_src, float scale, const int len)
{
    // Use fast math operation for better performance
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;

    if (pos < len) {
        d_res[pos] = __fmul_rn(d_src[pos], scale); // fmul_rn for faster multiplication
    }
}