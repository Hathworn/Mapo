#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void conv_horizontal_naive_gradWeight(const int n, float *y, const float *x, const int kL, const int iC)
{
    // Calculate index directly from thread and block index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    for (; i < n; i += stride) {
        // Direct computation of y[i] using precalculated indices
        y[i] = x[(i / kL) * kL * iC + i];
    }
}