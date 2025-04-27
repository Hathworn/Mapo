#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAdd_contiguous(float* a, float* b, float* dest, unsigned int numEls) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = gridDim.x * blockDim.x; // Use direct variable for stride
    
    for (unsigned int i = idx; i < numEls; i += stride) { // Use 'stride' for clarity and potential performance gain
        dest[i] = a[i] + b[i];
    }
}