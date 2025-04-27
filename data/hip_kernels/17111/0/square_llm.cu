#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function using threadIdx for better parallelism.
__global__ void square(int *array, int n) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (tid < n) {
        array[tid] *= array[tid]; // Square the element
    }
}