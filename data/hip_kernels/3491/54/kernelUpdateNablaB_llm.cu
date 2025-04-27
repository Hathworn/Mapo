#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelUpdateNablaB(float *nabla_b, float *delta_nabla_b) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global index
    nabla_b[idx] += delta_nabla_b[idx];               // Use global index for memory access
}