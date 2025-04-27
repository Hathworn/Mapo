#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kRectifiedLinearSmoothDeriv(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by using a single loop counter
    for (unsigned int i = threadId; i < numEls; i += blockDim.x * gridDim.x) {
        dest[i] = a[i] * (1 - __expf(-b[i])); // Improved readability
    }
}