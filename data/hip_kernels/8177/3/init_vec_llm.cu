#include "hip/hip_runtime.h"
#include "includes.h"

// The __restrict__ qualifier hints to the compiler that vec does not alias 
__global__ void init_vec(float* __restrict__ vec, float value) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < gridDim.x * blockDim.x) { // Check to avoid out-of-bounds memory write
        vec[tid] = value;
    }
}