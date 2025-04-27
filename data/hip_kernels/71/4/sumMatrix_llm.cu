#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrix(float *A, float *B, float *C, int nx, int ny) {
    // Calculate 2D thread index
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;

    // Check bounds and compute linear index
    if(ix < nx && iy < ny) {
        unsigned int idx = ix + iy * nx;
        C[idx] = A[idx] + B[idx];
    }
}