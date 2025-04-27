#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU2D(float *A, float *B, float *C, int Nx, int Ny) {
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Calculate single linear index for improved memory access pattern
    unsigned int idx = iy * Nx + ix; 

    if (ix < Nx && iy < Ny) {
        C[idx] = A[idx] + B[idx];
    }
}