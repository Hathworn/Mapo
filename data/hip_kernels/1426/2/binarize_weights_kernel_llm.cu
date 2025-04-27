#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = blockIdx.x * blockDim.x + threadIdx.x;
    if (f >= n) return;

    // Use shared memory for faster mean calculation
    __shared__ float sharedMean;
    float localMean = 0.0f;

    // Calculate mean in parallel using a single loop
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        localMean += fabsf(weights[f * size + i]);
    }
    atomicAdd(&sharedMean, localMean);

    __syncthreads();
    if (threadIdx.x == 0) {
        sharedMean /= size; // Compute average
    }
    __syncthreads();

    // Binarize weights using computed mean
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        binary[f * size + i] = (weights[f * size + i] > 0) ? sharedMean : -sharedMean;
    }
}