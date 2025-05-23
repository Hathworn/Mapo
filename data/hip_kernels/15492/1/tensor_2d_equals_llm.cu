#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {

#ifndef DTYPE
#define DTYPE float
#endif

}

__global__ void tensor_2d_equals (const int n, const int c, const DTYPE* x, const int offset_x, const int n_x, const int c_x, const DTYPE* y, const int offset_y, const int n_y, const int c_y, int* eq_flag) {
    // Compute global thread indices
    const int gid_n = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_c = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Check if indices are within bounds
    if (gid_n < n && gid_c < c) {
        // Calculate global memory indices for x and y
        const int ix = offset_x + gid_n * n_x + gid_c * c_x;
        const int iy = offset_y + gid_n * n_y + gid_c * c_y;

        // Atomic increment for thread safety
        if (x[ix] != y[iy]) {
            atomicAdd(eq_flag, 1);
        }
    }
}