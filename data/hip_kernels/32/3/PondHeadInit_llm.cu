#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void PondHeadInit(double *ph, int size) {
    // Calculate unique global thread id
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int gridSize = blockDim.x * gridDim.x;

    // Use loop unrolling for better performance
    for (int i = tid; i < size; i += gridSize) {
        ph[i] = psi_min;
    }
}