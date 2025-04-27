#include "hip/hip_runtime.h"
#include "includes.h"

// Improved global kernel function with parallelism
__global__ void square(int *array, int n) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Calculate unique global thread index
    if (tid < n)
        array[tid] *= array[tid]; // Perform square operation
}