#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conv_horizontal_naive_gradWeight(const int n, float *y, const float *x, const int kL, const int iC)
{
    // Improved to reduce division operation within the loop
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int totalThreads = blockDim.x * gridDim.x;

    for (int i = idx; i < n; i += totalThreads) {
        int baseIndex = (i / kL) * kL * iC;  // Calculate base index outside the loop
        y[i] = x[baseIndex + i];
    }
}