#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (f >= n) return;

    // Use shared memory to reduce global memory access
    extern __shared__ float shared_weights[];

    float mean = 0;

    // Load weights into shared memory block by block
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        shared_weights[i] = weights[f * size + i];
        mean += abs(shared_weights[i]);
    }

    // Ensure all threads have completed their mean calculation
    __syncthreads();

    mean = mean / size;

    // Use shared memory to set binary weights
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        binary[f * size + i] = (shared_weights[i] > 0) ? mean : -mean;
    }
}