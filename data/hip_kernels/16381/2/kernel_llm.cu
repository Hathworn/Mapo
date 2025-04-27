#include "hip/hip_runtime.h"
#include "includes.h"

// Improved global kernel function
__global__ void kernel(int* d_vec, int n) {

    int tid = blockIdx.x * blockDim.x + threadIdx.x;  // Account for global thread id

    if (tid < n) {
        int i = d_vec[tid];
        d_vec[tid] = i > 5 ? -i : i;
    }
}