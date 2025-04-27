#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float sigmoid(float x){
    return __frcp_rn(__fadd_rn(1, expf(-x))); // Use fast exp function for optimization
}

__global__ void sigmoidForward(float* R, float* V, int x, int y){
    int index = blockDim.x * blockIdx.x + threadIdx.x;
    int totalElements = x * y;  // Pre-compute total elements for efficiency
    if(index < totalElements)
        R[index] = sigmoid(V[index]);  // Optimize indexing within bounds
}