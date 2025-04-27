#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cu_copyMakeBorder(const float *src, float* dst, const int rowssrc, const int colssrc, const int up, const int down, const int left, const int right, const int n) {
    // Assign a unique thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    int colsdst = colssrc + left + right;

    // Loop over data with specified stride
    for(; tid < n; tid += stride) {
        int csrc = tid % colssrc;
        int rsrc = tid / colssrc;
        int rdst = up + rsrc;
        int cdst = left + csrc;

        // Copy source to destination with specified offset
        dst[rdst * colsdst + cdst] = src[tid];
    }
}