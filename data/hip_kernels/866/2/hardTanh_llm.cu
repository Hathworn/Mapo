#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void hardTanh(float* in, float* out, float min_val, float max_val, int size) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x;
    for (int i = tid; i < size; i += stride) {
        // Use clamp function for better readability and possible performance improvement
        out[i] = fmaxf(min_val, fminf(max_val, in[i]));
    }
}