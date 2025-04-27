#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void arrayFill(float* data, float value, int size) {
    // Cache grid and block calculations in registers
    int stride = gridDim.x * blockDim.x;
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Use __restrict__ keyword for data pointer to enhance compiler optimization
    float* __restrict__ data_ptr = data;

    for (int i = tid; i < size; i += stride) {
        // Ensure coalesced memory access pattern if possible
        data_ptr[i] = value;
    }
}