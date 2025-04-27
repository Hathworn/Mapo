#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _copy_mat(float *m, float* target, int len) {
    // Use shared memory for faster access
    extern __shared__ float s_data[];
    
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int lane_id = threadIdx.x;

    // Load data into shared memory
    if (tid < len) {
        s_data[lane_id] = m[tid];
    }
    __syncthreads();

    // Write data from shared memory to global memory
    if (tid < len) {
        target[tid] = s_data[lane_id];
    }
}