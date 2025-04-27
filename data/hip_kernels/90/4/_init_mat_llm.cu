#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void _init_mat(float *m, float val, int len) {
    // Use shared memory to reduce global memory transaction
    __shared__ float shared_val;
    if (threadIdx.x == 0) {
        shared_val = val;  // Initialize shared memory
    }
    __syncthreads();  // Ensure all threads have the updated shared memory

    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < len) {
        m[tid] = shared_val;  // Use shared memory instead of global variable
    }
}