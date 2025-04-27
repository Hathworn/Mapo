#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mAddExternForce(float *w_dimX, float *w_dimY, float *f_dimX, float *f_dimY, float dt) {
    int Idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (Idx < gridDim.x * blockDim.x) { // Ensure Idx is within bounds
        float halfFactor = -0.5f; // Define a constant factor
        w_dimX[Idx] *= halfFactor;
        w_dimY[Idx] *= halfFactor; // Use compound assignment
    }
}