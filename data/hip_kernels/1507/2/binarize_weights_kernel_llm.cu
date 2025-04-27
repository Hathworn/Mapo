#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    // Calculate the index for each thread
    int f = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    if (f >= n) return;

    float mean = 0.0f;
    float weight_sum = 0.0f;
    
    // Compute sum of absolute weights
    for (int i = 0; i < size; ++i) {
        weight_sum += fabs(weights[f * size + i]);
    }
    mean = weight_sum / size; // Calculate mean of absolute values

    // Binarize weights
    for (int i = 0; i < size; ++i) {
        binary[f * size + i] = (weights[f * size + i] > 0) ? mean : -mean;
    }
}