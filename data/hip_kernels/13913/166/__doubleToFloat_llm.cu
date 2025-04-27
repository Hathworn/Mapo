#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __doubleToFloat(double *A, float *B, int N) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Use stride loop for processing elements
    for (int i = idx; i < N; i += stride) {
        B[i] = (float)(A[i]);
    }
}