#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void assisted_activation2_kernel(float alpha, float *output, float *gt_gpu, float *a_avg_gpu, int size, int channels, int batches)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int b = i / size;
    float beta = 1 - alpha;

    // Optimize: Check bounds before calculations inside loop
    if (b < batches) {
        int xy = i % size;
        for (int c = 0; c < channels; ++c) {
            // Optimize: Pre-calculate index for reuse
            int index = xy + size * (c + channels * b);
            if (gt_gpu[index] == 0) {
                output[index] *= beta;
            }
        }
    }
}