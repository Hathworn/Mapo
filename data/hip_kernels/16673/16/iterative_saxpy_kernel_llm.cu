#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void iterative_saxpy_kernel(float *y, const float* x, const float alpha, const float beta, int n_loop)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread index is within array bounds
    if (idx < n_loop) {
        float xi = x[idx];
        #pragma unroll // Suggest loop unrolling for performance
        for (int i = 0; i < n_loop; i++)
            y[idx] = alpha * xi + beta;
    }
}