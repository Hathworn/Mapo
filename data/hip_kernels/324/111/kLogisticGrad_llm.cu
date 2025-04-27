#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLogisticGrad(float* mat, float* targets, float* out_grad, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < numEls) {  // Ensure thread processes valid index
        out_grad[idx] = (targets[idx] < 0) ? 0 : (mat[idx] - targets[idx]);
    }
}