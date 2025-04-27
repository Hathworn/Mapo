#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __intToLong(int *A, long long *B, int N) {
    int ip = threadIdx.x + blockDim.x * (blockIdx.x + gridDim.x * blockIdx.y);
    int stride = blockDim.x * gridDim.x * gridDim.y;
    
    // Unrolling loop for better performance
    for (int i = ip; i < N; i += stride) {
        B[i] = static_cast<long long>(A[i]);
    }
}