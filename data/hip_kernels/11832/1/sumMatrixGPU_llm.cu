#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixGPU(float *MatA, float *MatB, float *MatC, int nx, int ny) {
    // Calculate global thread ID for the 1D flattened matrix
    unsigned int idx = blockIdx.y * blockDim.y * nx + blockIdx.x * blockDim.x + threadIdx.y * nx + threadIdx.x;

    // Boundary check before operation
    if (idx < nx * ny) {
        MatC[idx] = MatA[idx] + MatB[idx];
    }
}