#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cu_transpose(const float* src, float* dst, int colssrc, int colsdst, int n){
    // Calculate row and column for destination matrix
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    if (tid < n) {
        int cdst = tid % colsdst;
        int rdst = tid / colsdst;
        
        // Efficiently calculate indices for source matrix
        dst[tid] = src[cdst * colssrc + rdst];
    }
}