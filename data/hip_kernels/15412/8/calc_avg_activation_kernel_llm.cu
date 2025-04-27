#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calc_avg_activation_kernel(float *src, float *dst, int size, int channels, int batches)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < size * batches) {
        int xy = i % size;
        int b = i / size;
        float sum = 0.0f;

        // Unroll the loop for performance improvement
        #pragma unroll
        for (int c = 0; c < channels; ++c) {
            sum += src[xy + size * (c + channels * b)];
        }
        
        // Calculate the average
        dst[i] = sum / channels;
    }
}