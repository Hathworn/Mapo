#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult(int* results, int* data, int* vec) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int result_val = 0;
    // Utilize shared memory for 'vec' to minimize global memory access latency
    __shared__ int shared_vec[cuda_features];

    // Load 'vec' into shared memory
    if (threadIdx.x < cuda_features) {
        shared_vec[threadIdx.x] = vec[threadIdx.x];
    }
    __syncthreads();

    // Calculate result using shared memory
    for (int i = 0; i < cuda_features; i++) {
        result_val += shared_vec[i] * data[(index * cuda_features) + i];
    }
    results[index] = result_val;
}