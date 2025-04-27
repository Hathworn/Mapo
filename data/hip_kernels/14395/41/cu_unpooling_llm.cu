#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cu_unpooling(const float* src, const float* loc, float* dst, const int colsdst, const int n) {
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Optimize by ensuring that each thread only processes the necessary array index
    if(tid < n) {
        int loc_val = (int)loc[tid];
        int cdst = loc_val % colsdst;
        int rdst = loc_val / colsdst;
        dst[rdst * colsdst + cdst] = src[tid];
    }
}