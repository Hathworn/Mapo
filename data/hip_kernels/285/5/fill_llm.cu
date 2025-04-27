#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill(float * w, float val, int size) {
    // Calculate global thread ID
    const int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unroll loop for potential performance gain
    for (int i = tid; i < size; i += blockDim.x * gridDim.x) {
        w[i] = val;
    }
}