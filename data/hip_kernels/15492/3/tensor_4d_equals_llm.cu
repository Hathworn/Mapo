#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {

#ifndef DTYPE
#define DTYPE float
#endif

}

__global__ void tensor_4d_equals(const int n, const int c, const int h, const int w, const DTYPE* x, const int offset_x, const int n_x, const int c_x, const int h_x, const int w_x, const DTYPE* y, const int offset_y, const int n_y, const int c_y, const int h_y, const int w_y, int* eq_flag) {
    const int gid_n = blockIdx.x * blockDim.x + threadIdx.x;
    const int gid_c = blockIdx.y * blockDim.y + threadIdx.y;
    const int gid_h = blockIdx.z * blockDim.z + threadIdx.z;
    const bool valid = (gid_n < n) && (gid_c < c) && (gid_h < h);

    // Use shared memory to reduce memory transaction overhead
    __shared__ int local_eq_flag;
    if (threadIdx.x == 0 && threadIdx.y == 0 && threadIdx.z == 0) {
        local_eq_flag = 0;
    }
    __syncthreads();

    if (valid) {
        const int ix = offset_x + gid_n * n_x + gid_c * c_x + gid_h * h_x;
        const int iy = offset_y + gid_n * n_y + gid_c * c_y + gid_h * h_y;
        for (int i = 0; i < w; i++) {
            if (x[ix + i * w_x] != y[iy + i * w_y]) {
                atomicAdd(&local_eq_flag, 1);  // Use atomic operation to update flag
            }
        }
    }
    
    __syncthreads();
    
    // Conditionally move from shared to global memory to avoid race
    if (threadIdx.x == 0 && threadIdx.y == 0 && threadIdx.z == 0) {
        atomicAdd(eq_flag, local_eq_flag);
    }
}