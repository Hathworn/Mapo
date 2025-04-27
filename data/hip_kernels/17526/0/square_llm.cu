#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function using blockDim.x and threadIdx.x
__global__ void square(int *array, int n) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < n) {
        array[tid] *= array[tid];
    }
}