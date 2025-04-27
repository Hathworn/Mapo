#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relabel2Kernel(int *components, int previousLabel, int newLabel, const int colsComponents, const int idx, const int frameRows) {
    // Calculate global index using block and thread indices
    uint globalIdx = (blockIdx.x * blockDim.x + threadIdx.x) * colsComponents + 
                     (blockIdx.y * blockDim.y + threadIdx.y) + 
                     colsComponents * frameRows * idx;
                     
    // Conditional branch to update labels
    if (components[globalIdx] == previousLabel) {
        components[globalIdx] = newLabel;
    }
}