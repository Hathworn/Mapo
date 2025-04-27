#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SoftmaxLossBackprop(const int *label, int num_labels, int batch_size, float *diff)
{
    // Calculate unique thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Exit if the thread index exceeds the batch size
    if (idx >= batch_size) return;
    
    // Use label value directly in computation
    diff[idx * num_labels + label[idx]] -= 1.0f;
}