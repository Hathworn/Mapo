#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void calc_avg_activation_kernel(float *src, float *dst, int size, int channels, int batches)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= size * batches) return; // Early exit if index is out of range

    int xy = i % size;
    int b = i / size;

    float sum = 0;
    // Use a temporary variable to accumulate results
    for (int c = 0; c < channels; ++c) {
        sum += src[xy + size * (c + channels * b)];
    }
    // Assign the average to the destination array
    dst[i] = sum / channels;
}