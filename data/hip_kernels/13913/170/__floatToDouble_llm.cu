#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __floatToDouble(float *A, double *B, int N) {
    // Calculate the global thread index
    int ip = threadIdx.x + blockDim.x * blockIdx.x + blockDim.x * gridDim.x * blockIdx.y;

    // Use a stride loop for better memory access pattern
    int stride = blockDim.x * gridDim.x * gridDim.y;
    for (int i = ip; i < N; i += stride) {
        B[i] = static_cast<double>(A[i]);
    }
}