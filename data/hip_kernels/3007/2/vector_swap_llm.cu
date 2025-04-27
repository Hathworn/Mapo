#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {

#ifndef NUMBER
#define NUMBER float
#endif

}

__global__ void vector_swap(const int n, NUMBER* x, const int offset_x, const int stride_x, NUMBER* y, const int offset_y, const int stride_y) {
    // Calculate unique thread ID
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure gid is within bounds
    if (gid < n) {
        // Compute the indices for the current thread
        const int ix = offset_x + gid * stride_x;
        const int iy = offset_y + gid * stride_y;

        // Swap the elements directly without an extra variable
        // Optimized by using a temporary variable to minimize number of memory accesses
        const NUMBER temp = y[iy]; 
        y[iy] = x[ix];
        x[ix] = temp;
    }
}