#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void elementwise_1D_1D_mul(float* in1, float* in2, float* out, int size) {
    // Compute global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Loop through the data in a stride pattern
    for (int i = tid; i < size; i += gridDim.x * blockDim.x) {
        // Perform element-wise multiplication
        out[i] = in1[i] * in2[i];
    }
}