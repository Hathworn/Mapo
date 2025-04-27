#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void clipAt(float* in, float bound, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Unroll loops for more efficient parallel execution
    for (; tid < size; tid += stride) {
        float value = in[tid];
        
        if (value > bound) {
            in[tid] = bound;
        } else if (value < -bound) {
            in[tid] = -bound;
        }
    }
}