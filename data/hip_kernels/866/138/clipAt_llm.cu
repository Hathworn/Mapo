#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void clipAt(float* in, float bound, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    for (; tid < size; tid += stride) {
        // Optimize boundary condition checks by removing redundant if statement
        float val = in[tid];
        if (val > bound) {
            in[tid] = bound;
        } else if (val < -bound) {
            in[tid] = -bound;
        }
    }
}