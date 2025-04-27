```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void assisted_activation_kernel(float alpha, float *output, float *gt_gpu, float *a_avg_gpu, int size, int channels, int batches)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int b = i / size;
    int xy = i % size;

    // Optimize by checking bounds first to avoid unnecessary calculations
    if (b < batches) {
        float gt_val = gt_gpu[i]; // Load once outside the loop
        float a_avg_val = a_avg_gpu[i]; // Load once outside the loop
        #pragma unroll // Unroll loop for potential performance gain
        for (int c = 0; c < channels; ++c) {
            int index = xy + size * (c + channels * b);
            output[index] += alpha * gt_val * a_avg_val;
        }
    }
}