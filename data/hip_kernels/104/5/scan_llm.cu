#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scan(float* in, float* out, float* post, int len) {
    __shared__ float scan_array[HALF_BLOCK_SIZE];
    unsigned int t = threadIdx.x;
    unsigned int start = 2 * blockIdx.x * BLOCK_SIZE;
    
    // Load elements into shared memory with boundary checks
    scan_array[t] = (start + t < len) ? in[start + t] : 0;
    scan_array[BLOCK_SIZE + t] = (start + BLOCK_SIZE + t < len) ? in[start + BLOCK_SIZE + t] : 0;
    __syncthreads();
    
    // Up-sweep/reduction phase
    for (unsigned int stride = 1; stride <= BLOCK_SIZE; stride <<= 1) {
        int index = (t + 1) * stride * 2 - 1;
        if (index < 2 * BLOCK_SIZE) scan_array[index] += scan_array[index - stride];
        __syncthreads();
    }
    
    // Down-sweep phase
    if (t == 0) scan_array[2 * BLOCK_SIZE - 1] = 0;
    __syncthreads();

    for (unsigned int stride = BLOCK_SIZE; stride > 0; stride >>= 1) {
        int index = (t + 1) * stride * 2 - 1;
        if (index + stride < 2 * BLOCK_SIZE) {
            float temp = scan_array[index];
            scan_array[index] += scan_array[index + stride];
            scan_array[index + stride] = temp;
        }
        __syncthreads();
    }

    // Write results back to global memory
    if (start + t < len) out[start + t] = scan_array[t];
    if (start + BLOCK_SIZE + t < len) out[start + BLOCK_SIZE + t] = scan_array[BLOCK_SIZE + t];
    
    // Save block's aggregate result if post array is provided
    if (post && t == 0) post[blockIdx.x] = scan_array[2 * BLOCK_SIZE - 1];
}