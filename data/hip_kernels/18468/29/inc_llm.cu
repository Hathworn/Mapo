#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel function by using shared memory for improved cache performance
__global__ void inc(int *array, size_t n) {
    extern __shared__ int sharedMem[];  // Declare shared memory
    size_t idx = threadIdx.x + blockDim.x * blockIdx.x;
    size_t stride = blockDim.x * gridDim.x; // Pre-calculate stride

    while (idx < n) {
        sharedMem[threadIdx.x] = array[idx]; // Load to shared memory
        __syncthreads(); // Ensure all loads to shared memory are complete

        sharedMem[threadIdx.x]++;  // Increment in shared memory
        __syncthreads(); // Ensure all increments are complete

        array[idx] = sharedMem[threadIdx.x]; // Store back to global memory
        idx += stride; // Move to next index
    }
}