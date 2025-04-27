#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output) {
    float sum = 0;
    float largest = -INFINITY;
    
    // Use shared memory for parallel reduction; consider the warp size
    extern __shared__ float shared_input[];
    int tid = threadIdx.x;
    
    // Step 1: Load data into shared memory, stride-based
    for (int i = tid; i < n; i += blockDim.x) {
        shared_input[i] = input[i * stride];
        largest = max(largest, shared_input[i]);
    }
    __syncthreads();

    // Step 2: Compute softmax using shared memory
    for (int i = tid; i < n; i += blockDim.x) {
        float e = expf((shared_input[i] - largest) / temp);
        sum += e;
        output[i * stride] = e;
    }
    __syncthreads();
    
    // Step 3: Normalize the result
    for (int i = tid; i < n; i += blockDim.x) {
        output[i * stride] /= sum;
    }
}

__device__ void softmax_device(int n, float *input, float temp, float *output) {
    float sum = 0;
    float largest = -INFINITY;
    
    extern __shared__ float shared_input[];
    int tid = threadIdx.x;
    
    // Load and find largest in shared memory
    for (int i = tid; i < n; i += blockDim.x) {
        shared_input[i] = input[i];
        largest = max(largest, shared_input[i]);
    }
    __syncthreads();

    // Calculate softmax
    for (int i = tid; i < n; i += blockDim.x) {
        float e = expf((shared_input[i] - largest) / temp);
        sum += e;
        output[i] = e;
    }
    __syncthreads();
    
    // Normalize the result
    for (int i = tid; i < n; i += blockDim.x) {
        output[i] /= sum;
    }
}

__global__ void softmax_kernel(int n, int offset, int batch, float *input, float temp, float *output) {
    int b = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (b >= batch) return;
    
    // Utilize shared memory per block and warp
    extern __shared__ float shared_input[];
    softmax_device(n, input + b * offset, temp, shared_input, output + b * offset);
}