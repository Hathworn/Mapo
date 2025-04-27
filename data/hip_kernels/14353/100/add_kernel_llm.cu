#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_kernel(int N, float ALPHA, float *X, int INCX) {
    // Calculate global thread index using grid-stride loop approach
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < N; i += blockDim.x * gridDim.x) {
        X[i * INCX] += ALPHA;  // Perform the operation only if within bounds
    }
}