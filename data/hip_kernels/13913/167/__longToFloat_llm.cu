#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void __longToFloat(long long *A, float *B, int N) {

    // Calculate the global index for this thread
    int idx = blockIdx.x * blockDim.x + threadIdx.x + 
              blockIdx.y * gridDim.x * blockDim.x; 

    if (idx < N) { // Ensure the index is within bounds
        B[idx] = static_cast<float>(A[idx]); // Convert long to float
    }
}