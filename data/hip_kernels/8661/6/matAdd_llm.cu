#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matAdd(int *yd, float *Ag, float *Bg, float *Cg) {
    // Calculate flattened index for 2D grid
    int idx = blockIdx.y * blockDim.y * (*yd) + blockIdx.x * blockDim.x + threadIdx.y * (*yd) + threadIdx.x;
    
    // Element-wise addition using flattened index
    Cg[idx] = Ag[idx] + Bg[idx];
}