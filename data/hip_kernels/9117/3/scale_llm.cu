#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale(float *a, int size, int c) {
    int index = c;
    // Using blockIdx and threadIdx for parallel processing
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure tid is within bounds and processing only necessary elements
    for (int k = index + 1 + tid; k < size; k += blockDim.x * gridDim.x) {
        a[size * index + k] = (float) a[size * index + k] / a[size * index + index];
    }
}