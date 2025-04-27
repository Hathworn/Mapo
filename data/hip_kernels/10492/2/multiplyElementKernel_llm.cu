#include "hip/hip_runtime.h"
#include "includes.h"

static __device__ float E = 2.718281828;

__global__ void multiplyElementKernel(float *src1, float *src2, float *dst, int block_size)
{
    // Calculate the global index
    int di = blockIdx.x * block_size + threadIdx.x;
    
    // Check bounds within global size
    if (di < block_size * gridDim.x) {
        // Perform element-wise multiplication
        dst[di] = src1[di] * src2[di];
    }
}