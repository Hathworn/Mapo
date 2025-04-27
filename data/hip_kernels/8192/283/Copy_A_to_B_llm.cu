#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Copy_A_to_B(float *A, float *B, int size) {
    // Calculate global thread ID in a simplified way
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < size) {
        B[id] = A[id];
    }
}