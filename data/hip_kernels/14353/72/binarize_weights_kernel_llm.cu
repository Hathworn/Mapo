#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure valid range for f
    if (f >= n) return;
    
    // Initializes the mean variable
    float mean = 0;
    
    // Use shared memory to reduce global memory access latency
    extern __shared__ float shared_weights[];
    
    // Load weights into shared memory
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        shared_weights[i] = abs(weights[f * size + i]);
    }
    
    // Synchronize threads before using shared memory results
    __syncthreads();
    
    // Accumulate mean in shared memory to optimize access
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        mean += shared_weights[i];
    }
    
    // Reduce total mean using a block-wide reduction and synchronize
    atomicAdd(&mean, shared_weights[threadIdx.x]);
    __syncthreads();
    
    // Calculate mean once per thread
    mean = mean / size;
    
    // Binarization using calculated mean
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        binary[f * size + i] = (weights[f * size + i] > 0) ? mean : -mean;
    }
}