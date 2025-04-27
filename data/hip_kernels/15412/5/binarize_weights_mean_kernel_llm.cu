#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_mean_kernel(float *weights, int n, int size, float *binary, float *mean_arr_gpu)
{
    // Calculate global index for current thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread operates within bounds
    if (i < n * size) {
        int f = i / size;

        // Retrieve mean once per feature
        float mean = mean_arr_gpu[f];

        // Assign binary result based on weight sign
        binary[i] = (weights[i] > 0) ? mean : -mean;
    }
}