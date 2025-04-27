#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void assisted_activation2_kernel(float alpha, float *output, float *gt_gpu, float *a_avg_gpu, int size, int channels, int batches)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    float beta = 1 - alpha;

    if (i >= batches * size) return; // Avoid out-of-bounds accesses

    int xy = i % size;
    int b = i / size;

    if (b < batches) {
        if (gt_gpu[i] == 0) {
            for (int c = 0; c < channels; ++c) {
                // Improve memory coalescing by accessing output with a stride pattern
                output[xy + size * (c + channels * b)] *= beta;
            }
        }
    }
}