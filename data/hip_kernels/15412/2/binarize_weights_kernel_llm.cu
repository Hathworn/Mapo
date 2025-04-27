#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (f >= n) return;
 
    float mean = 0.0f;
    
    // Unrolling loop to improve performance
    for (int i = 0; i < size; i += 4) {
        mean += fabs(weights[f * size + i]);
        if (i + 1 < size) mean += fabs(weights[f * size + i + 1]);
        if (i + 2 < size) mean += fabs(weights[f * size + i + 2]);
        if (i + 3 < size) mean += fabs(weights[f * size + i + 3]);
    }
    mean /= size;

    // Use shared memory for improved cache efficiency
    extern __shared__ float shared_binary[];

    for (int i = 0; i < size; ++i) {
        shared_binary[threadIdx.x * size + i] = (weights[f * size + i] > 0) ? mean : -mean;
    }

    // Copy shared memory to global memory
    for (int i = 0; i < size; ++i) {
        binary[f * size + i] = shared_binary[threadIdx.x * size + i];
    }
}