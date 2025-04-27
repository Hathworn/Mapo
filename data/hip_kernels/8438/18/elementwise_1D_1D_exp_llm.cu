#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void elementwise_1D_1D_exp(float* in, float* out, int size) {
    // Calculate the thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Use a while loop for improved readability & efficiency
    while (tid < size) {
        out[tid] = exp(in[tid]); // Perform the element-wise exponential operation
        tid += gridDim.x * blockDim.x; // Increment to the next stride
    }
}