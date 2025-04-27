#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void minusKernel(float* A, int size) {
    // Use grid-stride loop for better utilization
    for (int id = blockIdx.x * blockDim.x + threadIdx.x; id < size; id += blockDim.x * gridDim.x) {
        A[id] = 1 - A[id];
    }
}