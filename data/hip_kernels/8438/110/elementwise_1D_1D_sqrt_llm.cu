#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void elementwise_1D_1D_sqrt(float* in, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Unroll loop for better performance
    for (int i = tid; i < size; i += stride * 4) {
        if (i < size) out[i] = sqrt(in[i]);
        if (i + stride < size) out[i + stride] = sqrt(in[i + stride]);
        if (i + 2 * stride < size) out[i + 2 * stride] = sqrt(in[i + 2 * stride]);
        if (i + 3 * stride < size) out[i + 3 * stride] = sqrt(in[i + 3 * stride]);
    }
}