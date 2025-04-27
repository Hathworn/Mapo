#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2norm_kernel(int N, float *x, float *dx, int batch, int filters, int spatial)
{
    // Calculate the flat index for the current thread
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (index >= N) return;
    
    int b = index / spatial;
    int i = index % spatial;
    float sum = 0.0f;
    
    // Reduce and cache sum of squares using registers
    for (int f = 0; f < filters; ++f) {
        int idx = b * filters * spatial + f * spatial + i;
        float val = x[idx];
        sum += val * val;
    }
    
    // Normalize sum and guard against division by zero
    sum = sqrtf(sum);
    float invSum = (sum == 0.0f) ? 1.0f : 1.0f / sum;
    
    // Normalize x and compute dx using precomputed invSum
    for (int f = 0; f < filters; ++f) {
        int idx = b * filters * spatial + f * spatial + i;
        x[idx] *= invSum;
        dx[idx] = (1.0f - x[idx]) * invSum;
    }
}