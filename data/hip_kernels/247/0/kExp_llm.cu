#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kExp(float* gData, float* target, unsigned int numElements) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use unrolled loop for better performance
    unsigned int stride = blockDim.x * gridDim.x;
    for (unsigned int i = idx; i + 3 < numElements; i += 4 * stride) { 
        target[i] = __expf(gData[i]);
        if (i + stride < numElements) target[i + stride] = __expf(gData[i + stride]);
        if (i + 2 * stride < numElements) target[i + 2 * stride] = __expf(gData[i + 2 * stride]);
        if (i + 3 * stride < numElements) target[i + 3 * stride] = __expf(gData[i + 3 * stride]);
    }
}