#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void prefixSum(float* arr, int step) {

    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread doesn't go out of bounds
    if (i < step) return;

    // Use shared memory to reduce global memory accesses and increase memory coalescing
    extern __shared__ float shared_arr[];

    // Load data into shared memory
    shared_arr[threadIdx.x] = arr[i - step];
    __syncthreads();

    // Compute prefix sum using shared memory
    arr[i] += shared_arr[threadIdx.x];
}