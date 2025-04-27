```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fmaf_kernel(float *d_x, float *d_y, float *d_z, int size)
{
    int idx_x = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
  
    // Use grid-stride loop for efficient parallelism
    for (int i = idx_x; i < size; i += stride) {
        d_z[i] = __fmul_rn(d_x[i], d_y[i]); // Use fast multiplication intrinsic
    }
}