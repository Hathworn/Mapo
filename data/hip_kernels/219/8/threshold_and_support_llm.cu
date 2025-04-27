#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void threshold_and_support(float *vec, int *support, const int n, const float T)
{
    unsigned int xIndex = blockDim.x * blockIdx.x + threadIdx.x;

    // Check if xIndex is within bounds
    if (xIndex >= n) return;

    // Use fabs to optimize the absolute value computation
    if (fabsf(vec[xIndex]) < T) {
        vec[xIndex] = 0.0f;
        support[xIndex] = 2;
    }
}