#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __floatToLong(float *A, long long *B, int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride pattern for coalesced memory access and efficient iteration
    int stride = blockDim.x * gridDim.x;
    for (int i = idx; i < N; i += stride) {
        B[i] = static_cast<long long>(A[i]);  // Explicit cast for clarity
    }
}