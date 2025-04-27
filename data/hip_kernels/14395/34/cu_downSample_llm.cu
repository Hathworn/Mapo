#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cu_downSample(const float *src, float* dst, const int y_stride, const int x_stride, const int colssrc, const int n) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    int colsdst = (colssrc + x_stride - 1) / x_stride;  // Simplified calculation of colsdst
    while (tid < n) {
        int cdst = tid % colsdst;
        int rdst = tid / colsdst;
        int rsrc = rdst * y_stride;
        int csrc = cdst * x_stride;
        dst[tid] = src[rsrc * colssrc + csrc];
        tid += stride;
    }
}