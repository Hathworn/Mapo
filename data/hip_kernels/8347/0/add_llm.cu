#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void add(int n, float* a, float* b, float* sum) {
    // Optimizing with shared memory use
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    __shared__ float s_a[1024]; // Shared memory allocation
    __shared__ float s_b[1024]; // Shared memory allocation
    if (index < n) {
        s_a[threadIdx.x] = a[index]; // Load into shared memory
        s_b[threadIdx.x] = b[index]; // Load into shared memory
        __syncthreads(); // Synchronize threads before use
        
        for (int i = index; i < n; i += stride) {
            sum[i] = s_a[threadIdx.x] + s_b[threadIdx.x]; // Use shared memory
        }
    }
}