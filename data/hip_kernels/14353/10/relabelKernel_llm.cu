#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relabelKernel(int *components, int previousLabel, int newLabel, const int colsComponents) {
    // Calculate the linear index in a single statement for improved performance
    uint index = (blockIdx.x * blockDim.x + threadIdx.x) * colsComponents + (blockIdx.y * blockDim.y + threadIdx.y;
    
    // Use inline conditional check to avoid branch divergence
    if (components[index] == previousLabel) {
        components[index] = newLabel;
    }
}