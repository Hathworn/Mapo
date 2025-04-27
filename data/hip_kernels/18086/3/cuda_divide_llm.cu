#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cuda_divide(float *dst, float *numerator, float *denominator, int width, int height)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x;  // Combine row and col into single index
    int totalThreads = gridDim.x * blockDim.x;  // Compute total number of threads

    for (int i = idx; i < width * height; i += totalThreads) {  // Loop to allow each thread to process multiple elements
        if (denominator[i] > 0.0000001) {
            dst[i] = numerator[i] / denominator[i];
        } else {
            dst[i] = 0;
        }
        // printf("dst[%d] = %f\n", i, dst[i]);
    }
}