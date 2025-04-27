#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __intToFloat(int *A, float *B, int N) {
    // Calculate the global index once, instead of repeatedly inside the loop
    int idx = threadIdx.x + blockDim.x * (blockIdx.x + gridDim.x * blockIdx.y);
    int stride = blockDim.x * gridDim.x * gridDim.y;
    
    // Utilize stride-based looping for better data access pattern
    for (int i = idx; i < N; i += stride) {
        B[i] = static_cast<float>(A[i]);
    }
}