#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd(int *A, int *B, int *C, int numElements) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread index does not exceed number of elements
    if (i < numElements) {
        C[i] = A[i] + B[i];
    }
}