#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void clipAt(float* in, float bound, int size) {
    // Calculate unique thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if index is within bounds and apply bounds clipping
    if (tid < size) {
        float value = in[tid];
        in[tid] = value > bound ? bound : (value < -bound ? -bound : value);
    }
}