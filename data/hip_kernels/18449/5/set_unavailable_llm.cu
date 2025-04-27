#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_unavailable(bool *available, int n_rows, const int *idx, int n_selected) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Improve memory access by using shared memory
    __shared__ int shared_idx[256]; 

    if (tid < n_selected) {
        // Load indexes into shared memory
        shared_idx[threadIdx.x] = idx[tid];
        __syncthreads(); // Ensure all writes to shared memory are complete

        // Use shared memory for updating availability
        atomicExch(&available[shared_idx[threadIdx.x]], false);
    }
}