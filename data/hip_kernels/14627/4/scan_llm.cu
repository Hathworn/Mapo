#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scan(float * input, float * output, int len) {
    extern __shared__ float temp[]; // Allocate shared memory
    int tid = threadIdx.x;
    int offset = 1;
    
    // Load input into shared memory
    temp[2 * tid]     = (2 * tid < len)     ? input[2 * tid]     : 0;
    temp[2 * tid + 1] = (2 * tid + 1 < len) ? input[2 * tid + 1] : 0;

    // Up-sweep phase
    for (int d = len >> 1; d > 0; d >>= 1) {
        __syncthreads();
        if (tid < d) {
            int ai = offset * (2 * tid + 1) - 1;
            int bi = offset * (2 * tid + 2) - 1;
            temp[bi] += temp[ai];
        }
        offset *= 2;
    }

    // Clear last element
    if (tid == 0) { temp[len - 1] = 0; }

    // Down-sweep phase
    for (int d = 1; d < len; d *= 2) {
        offset >>= 1;
        __syncthreads();
        if (tid < d) {
            int ai = offset * (2 * tid + 1) - 1;
            int bi = offset * (2 * tid + 2) - 1;
            float t = temp[ai];
            temp[ai] = temp[bi];
            temp[bi] += t;
        }
    }

    __syncthreads();
    
    // Write results to output
    if (2 * tid < len)     output[2 * tid] = temp[2 * tid];
    if (2 * tid + 1 < len) output[2 * tid + 1] = temp[2 * tid + 1];
}