#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized adam_kernel with thread-coarsening to improve memory access patterns
__global__ void adam_kernel(int N, float *x, float *m, float *v, float B1, float B2, float rate, float eps, int t)
{
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    int stride = gridDim.x * gridDim.y * blockDim.x;
    
    float rate_sqrt_B2 = rate * sqrtf(1.f - powf(B2, t)) / (1.f - powf(B1, t));
    
    for (int i = index; i < N; i += stride) {
        x[i] += rate_sqrt_B2 * m[i] / (sqrtf(v[i]) + eps);
    }
}