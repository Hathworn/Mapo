#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cu_fliplr(const float* src, float* dst, const int rows, const int cols, const int n) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    
    // Calculate position one-time outside loop for efficiency
    int c = tid % cols;
    int r = tid / cols;
    
    while (tid < n) {
        // Directly compute source index instead of using a complex formula
        int src_index = (cols - c - 1) + r * cols;
        dst[tid] = src[src_index];
        tid += stride;
        
        // Update 'c' and 'r' based on new 'tid' value
        c = tid % cols;
        r = tid / cols;
    }
}