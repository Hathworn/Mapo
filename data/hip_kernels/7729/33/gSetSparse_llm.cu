#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gSetSparse(float* out, const size_t* indices, const float* values, int length) {
    // Calculate the global index once outside the loop
    int index = blockIdx.x * blockDim.x + threadIdx.x; 
    if(index < length) {
        out[indices[index]] = values[index];
    }
    // Use grid-stride loop for better utilization
    for(index += blockDim.x * gridDim.x; index < length; index += blockDim.x * gridDim.x) {
        out[indices[index]] = values[index];
    }
}