#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calc_avg_activation_kernel(float *src, float *dst, int size, int channels, int batches)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= size * batches) return; // Early exit for out-of-bounds

    int xy = i % size;
    int b = i / size;

    float sum = 0.0f;
    // Use shared memory if possible or adjust loop for efficient memory access
    for (int c = 0; c < channels; ++c) {
        sum += src[xy + size * (c + channels * b)];
    }
    dst[i] = sum / channels;
}