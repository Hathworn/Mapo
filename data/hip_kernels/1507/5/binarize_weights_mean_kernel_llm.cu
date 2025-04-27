#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_mean_kernel(float *weights, int n, int size, float *binary, float *mean_arr_gpu)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n * size) { // Calculate boundary condition using a single if
        int f = i / size;
        float mean = mean_arr_gpu[f];
        binary[i] = (weights[i] > 0) ? mean : -mean; // Perform computation directly without additional checks
    }
}