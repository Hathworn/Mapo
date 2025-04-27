#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cu_interpolation(const float* __restrict__ src, float* __restrict__ dst, const int colssrc, const int colsdst, const int _stride, const int n) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    
    // Loop unrolling for better performance
    for (int i = tid; i < n; i += stride) {
        int csrc = i % colssrc;
        int rsrc = i / colssrc;
        int rdst = rsrc * _stride;
        int cdst = csrc * _stride;
        dst[rdst * colsdst + cdst] = src[i];
    }
}