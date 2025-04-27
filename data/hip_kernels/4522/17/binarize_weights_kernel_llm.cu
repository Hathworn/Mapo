#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = blockIdx.x * blockDim.x + threadIdx.x;
    if (f >= n) return;

    // Optimize mean calculation by using shared memory
    extern __shared__ float shared_weights[]; // Shared memory allocation
    float sum = 0.0f;
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        shared_weights[i] = fabsf(weights[f*size + i]);
        sum += shared_weights[i];
    }
    __syncthreads();  // Ensure all threads have completed the sum

    // Reduce shared_weights to compute mean
    sum = 0.0f;
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        sum += shared_weights[i];
    }
    mean = sum / size;
    
    // Broadcast mean and binarize weights
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        binary[f*size + i] = (weights[f*size + i] > 0) ? mean : -mean;
    }
}