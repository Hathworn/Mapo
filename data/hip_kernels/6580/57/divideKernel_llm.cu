#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void divideKernel(float* A, int size) {
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread acts only on valid data range, using warp divergence minimization
    if (id < size) {
        A[id] = __fdividef(1.0f, A[id]);  // Use fast float division intrinsic
    }
}