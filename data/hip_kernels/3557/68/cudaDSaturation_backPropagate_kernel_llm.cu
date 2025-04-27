#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaDSaturation_backPropagate_kernel(double* x, double* dx, unsigned int size, double threshold)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    
    if (threshold != 0.0) {
        for (unsigned int i = index; i < size; i += stride) {
            // Use ternary operation directly to avoid branching
            dx[i] *= (x[i] > -threshold && x[i] < threshold) ? 1.0 : 0.0;
        }
    }
}