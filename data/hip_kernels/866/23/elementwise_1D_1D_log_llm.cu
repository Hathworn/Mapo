#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void elementwise_1D_1D_log(float* in, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Perform computation only if tid is within range
    if (tid < size) {
        // Use a stride to allow all threads to contribute to the computation
        for (int i = tid; i < size; i += gridDim.x * blockDim.x) {
            out[i] = logf(in[i]); // Use logf for better precision and performance on floats
        }
    }
}