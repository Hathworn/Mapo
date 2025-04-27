#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel function
__global__ void square(int *array, int n) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (tid < n) { // Boundary check
        array[tid] *= array[tid]; // Square the element
    }
}