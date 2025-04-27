#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mapKex(const int nwl, const float *r, int *kex) {
    // Calculate the global thread index
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Optimized boundary check and calculation
    if (i < nwl) {
        // Simplified computation inside kernel
        kex[i] = (int)(r[i] * 2.999999f);  
    }
}