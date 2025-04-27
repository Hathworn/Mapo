#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void atomic_red(const float *gdata, float *out){
    // Calculate global thread index
    size_t idx = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Use grid-stride loop to improve memory coalescing
    for (size_t i = idx; i < N; i += gridDim.x * blockDim.x) {
        atomicAdd(out, gdata[i]);
    }
}