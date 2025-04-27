#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matSum(float* S, float* A, float* B, int N) {
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Simplify calculation of global thread index
    if (i < N && j < N) {
        int tid = i * N + j;
        S[tid] = A[tid] + B[tid];
    }
}