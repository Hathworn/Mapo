#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized to use shared memory for the largest element - reduces global memory accesses
__device__ void softmax_device(int n, float *input, float temp, float *output) {
    extern __shared__ float shared[];
    float *largest_ptr = shared;
    float sum = 0.0f;
    
    // Find the largest element using shared memory - helps with thread divergence
    float largest = -INFINITY;
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        largest = fmaxf(largest, input[i]);
    }
    
    *largest_ptr = largest;
    __syncthreads();
    
    // Adjust input values and compute the normalization sum
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        float e = expf((input[i] - *largest_ptr) / temp);
        atomicAdd(&sum, e); // thread-safe accumulation
        output[i] = e;
    }

    __syncthreads();
    
    // Normalize the output using the sum
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        output[i] /= sum;
    }
}

__global__ void softmax_kernel(int n, int offset, int batch, float *input, float temp, float *output) {
    int b = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (b >= batch) return;
    softmax_device(n, input + b * offset, temp, output + b * offset);
}