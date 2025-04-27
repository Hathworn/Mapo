#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conv_vertical_naive_gradWeight(const int n, float *y, const float *x, const int kL, const int iC)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridStride = blockDim.x * gridDim.x;
    
    // Use strided loop for better GPU utilization
    for (; i < n; i += gridStride) {
        int idx = (i / kL) * kL * iC + i; // Avoid recalculating index every iteration
        y[i] = x[idx];
    }
}