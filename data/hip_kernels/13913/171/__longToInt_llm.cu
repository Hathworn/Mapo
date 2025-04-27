#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __longToInt(long long *A, int *B, int N) {
    // Calculate global thread index
    int idx = threadIdx.x + blockDim.x * blockIdx.x + blockDim.x * gridDim.x * blockIdx.y;
    
    // Optimize loop to limit unnecessary computations
    for (int i = idx; i < N; i += blockDim.x * gridDim.x * gridDim.y) {
        B[i] = static_cast<int>(A[i]);  // Use static_cast for clarity
    }
}