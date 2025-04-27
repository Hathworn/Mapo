#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_mean_kernel(float *weights, int n, int size, float *binary, float *mean_arr_gpu)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= n * size) return;  // Exit if idx exceeds total number of weights

    int f = idx / size;
    float mean = mean_arr_gpu[f];
    
    // Use ternary operation for efficiency
    binary[idx] = (weights[idx] > 0) ? mean : -mean;
}