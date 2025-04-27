#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void clipAt(float* in, float bound, int size) {
    // Calculate global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure each thread processes elements spaced by total number of threads
    for (; tid < size; tid += blockDim.x * gridDim.x) {
        // Clip values at bounds
        if (in[tid] > bound) in[tid] = bound;
        else if (in[tid] < -bound) in[tid] = -bound;
    }
}