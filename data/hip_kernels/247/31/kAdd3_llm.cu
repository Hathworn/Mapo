#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd3(float* a, const float* b, const float* c, const unsigned int numEls, const float scaleA, const float scaleB, const float scaleC) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    for (unsigned int i = idx; i < numEls; i += stride) {
        a[i] = scaleA * a[i] + scaleB * b[i] + scaleC * c[i];
    }
}