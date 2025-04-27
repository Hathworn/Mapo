#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = blockIdx.x * blockDim.x + threadIdx.x;
    int gridStride = gridDim.x * blockDim.x;

    // Process the weights using grid-stride loop
    for (; f < n; f += gridStride) {
        float mean = 0.0f;

        // Unroll the loop for mean calculation
        for (int i = 0; i < size; ++i) {
            mean += fabsf(weights[f * size + i]);
        }
        mean /= size;

        // Unroll the loop for binary assignment
        for (int i = 0; i < size; ++i) {
            binary[f * size + i] = (weights[f * size + i] > 0) ? mean : -mean;
        }
    }
}