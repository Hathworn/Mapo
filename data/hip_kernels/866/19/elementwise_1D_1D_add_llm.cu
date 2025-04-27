#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void elementwise_1D_1D_add(float* in1, float* in2, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Calculate unique thread index
    int stride = blockDim.x * gridDim.x; // Total threads in the grid
    while (tid < size) { // Efficient loop for processing data
        out[tid] = in1[tid] + in2[tid]; // Perform element-wise addition
        tid += stride; // Move to the next element handled by the thread
    }
}