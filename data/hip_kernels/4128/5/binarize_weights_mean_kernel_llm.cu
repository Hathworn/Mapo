#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_mean_kernel(float *weights, int n, int size, float *binary, float *mean_arr_gpu)
{
    // Optimize thread index calculations for improved readability
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= n * size) return; // Check boundary in one step

    // Determine filter index
    int f = i / size;

    // Retrieve and apply mean to binarize weights
    float mean = mean_arr_gpu[f];
    binary[i] = (weights[i] > 0) ? mean : -mean;
}