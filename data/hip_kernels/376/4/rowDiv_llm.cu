#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rowDiv(float* a, float* b, float* c, int M, int N){
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread is within bounds
    if (i < M * N) {
        // Efficiently perform row-wise division
        c[i] = a[i] / b[blockIdx.x];
    }
}