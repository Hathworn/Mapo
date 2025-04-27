#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {

#ifndef DTYPE
#define DTYPE float
#endif

}

__global__ void tensor_1d_equals(const int n, const DTYPE* __restrict__ x, const int offset_x, const int stride_x, const DTYPE* __restrict__ y, const int offset_y, const int stride_y, int* __restrict__ eq_flag) {
    // Calculate global thread ID
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread is within bounds
    if (gid < n) {
        const int ix = offset_x + gid * stride_x;
        const int iy = offset_y + gid * stride_y;
        
        // Perform comparison and increment if not equal
        if (x[ix] != y[iy]) {
            atomicAdd(eq_flag, 1); // Use atomic to avoid race conditions
        }
    }
}