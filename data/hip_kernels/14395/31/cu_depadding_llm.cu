#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cu_depadding(const float* src, float* dst, const int rows1, const int cols1, const int cols2, const int n) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int pad = (cols1 - cols2) / 2;

    // Use a fixed stride for better efficiency
    for (int idx = tid; idx < n; idx += blockDim.x * gridDim.x) {
        int c2 = idx % cols2;
        int r2 = idx / cols2;
        int r1 = r2 + pad;
        int c1 = c2 + pad;
        dst[idx] = src[r1 * cols1 + c1];
    }
}