#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {

#ifndef NUMBER
#define NUMBER float
#endif

}

__global__ void vector_equals (const int n, const NUMBER* x, const int offset_x, const int stride_x, const NUMBER* y, const int offset_y, const int stride_y, int* eq_flag) {

    // Utilize shared memory to reduce atomic updates to global memory
    __shared__ int local_eq_flag;

    if(threadIdx.x == 0) {
        local_eq_flag = 0; // Initialize shared counter
    }
    __syncthreads();

    const int gid = blockIdx.x * blockDim.x + threadIdx.x;
    if (gid < n) {
        const int ix = offset_x + gid * stride_x;
        const int iy = offset_y + gid * stride_y;
        if (x[ix] != y[iy]) {
            atomicAdd(&local_eq_flag, 1); // Accumulate in shared memory
        }
    }
    __syncthreads();

    // Update global counter with block's result
    if(threadIdx.x == 0) {
        atomicAdd(eq_flag, local_eq_flag);
    }
}