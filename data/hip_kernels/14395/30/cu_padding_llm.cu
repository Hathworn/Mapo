#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cu_padding(const float* src, float* dst, const int rows1, const int cols1, const int cols2, const int n) {
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Padding offset
    int pad = (cols2 - cols1) / 2;

    // Ensure thread works within bound
    if (tid < n) {
        int c1 = tid % cols1;
        int r1 = tid / cols1;
        int r2 = r1 + pad;
        int c2 = c1 + pad;

        // Write padded data
        dst[r2 * cols2 + c2] = src[tid];
    }
}