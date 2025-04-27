#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArrayOnGPU(float *A, float *B, float *C) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Compute global thread ID
    C[i] = A[i] + B[i]; // Perform vector addition
}