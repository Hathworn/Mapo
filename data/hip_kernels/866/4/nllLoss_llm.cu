#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void nllLoss(float *x, int x_stride, float *y, int* target) {
    // Calculate a unique thread index for current thread
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Avoid accessing out of bounds
    if (tid < gridDim.x * blockDim.x) {
        // Calculate memory offset for the current thread
        int offset = __mul24(tid, x_stride) + target[tid];
        
        // Assign loss value to output array
        y[tid] = -x[offset];
    }
}