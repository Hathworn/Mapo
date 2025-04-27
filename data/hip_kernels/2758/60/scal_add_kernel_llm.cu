#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_add_kernel(int N, float ALPHA, float BETA, float *X, int INCX) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified block index calculation
    int stride = blockDim.x * gridDim.x;              // Calculate stride for skipping blocks
    for (int i = idx; i < N; i += stride) {           // Loop through all elements with a stride
        X[i * INCX] = X[i * INCX] * ALPHA + BETA;     // Efficient memory access pattern
    }
}