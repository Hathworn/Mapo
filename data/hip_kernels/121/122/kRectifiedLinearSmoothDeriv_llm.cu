#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kRectifiedLinearSmoothDeriv(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Unroll loop for efficiency
    for (unsigned int i = idx; i < numEls; i += blockDim.x * gridDim.x) {
        dest[i] = a[i] * (1 - __expf(-b[i]));
    }
}