#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = blockIdx.x * blockDim.x + threadIdx.x; // Simplify the indexing calculation
    if (f >= n) return;

    float mean = 0.0f;
    float *weights_f = weights + f * size; // Access weights only for this specific index
    float *binary_f = binary + f * size;

    for (int i = 0; i < size; ++i) {
        mean += fabsf(weights_f[i]);
    }
    mean /= size; // Compute the mean

    for (int i = 0; i < size; ++i) {
        binary_f[i] = (weights_f[i] > 0) ? mean : -mean;
    }
}