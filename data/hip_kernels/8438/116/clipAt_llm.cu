#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void clipAt(float* in, float bound, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    // Unrolling the loop to improve performance
    for (; tid < size; tid += stride * 2) {
        if (in[tid] > bound) in[tid] = bound;
        else if (in[tid] < -bound) in[tid] = -bound;
        // Process the next element in parallel
        int next_tid = tid + stride;
        if (next_tid < size) {
            if (in[next_tid] > bound) in[next_tid] = bound;
            else if (in[next_tid] < -bound) in[next_tid] = -bound;
        }
    }
}