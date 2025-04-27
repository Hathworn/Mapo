#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fTanh(const float* arguments, float* results, const long size) {
    // Calculate global index using block and thread indexing for improved clarity
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds before accessing data
    if (index < size) {
        results[index] = tanh(arguments[index]);
    }
}