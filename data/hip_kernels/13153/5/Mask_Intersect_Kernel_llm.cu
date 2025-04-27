#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Mask_Intersect_Kernel(int* A, int* B, int* devOut, int numElements) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure the thread only processes valid index
    if (idx < numElements) {
        devOut[idx] = A[idx] * B[idx];
    }
}