#include "hip/hip_runtime.h"
#include "includes.h"

static __device__ float E = 2.718281828;

__global__ void reduceArgMaxKernel(float *src, float *dst, float *arg, int dim_size, int block_size)
{
    // Each thread processes its own block index
    int di = blockIdx.x * block_size + threadIdx.x;
    int si = di * dim_size;
    
    // Initialize local memory for reduction
    float max = src[si];
    int maxi = 0;

    // Efficient iteration over dimension size
    for (int i = 1; i < dim_size; i++) {
        float now = src[si + i];
        if (now > max) {
            max = now;
            maxi = i;
        }
    }
    
    // Save results in global memory
    dst[di] = max;
    arg[di] = maxi;
}