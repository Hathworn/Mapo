```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void assisted_activation_kernel(float alpha, float *output, float *gt_gpu, float *a_avg_gpu, int size, int channels, int batches)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= size * batches) return; // Early exit if index exceeds limit

    int xy = i % size;
    int b = i / size;

    for (int c = 0; c < channels; ++c) {
        int idx = xy + size * (c + channels * b); // Compute index outside loop
        float gt_val = gt_gpu[i]; // Load reused values outside the inner loop
        float a_avg_val = a_avg_gpu[i];
        output[idx] += alpha * gt_val * a_avg_val;
    }
}