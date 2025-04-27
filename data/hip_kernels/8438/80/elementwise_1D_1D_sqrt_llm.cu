#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void elementwise_1D_1D_sqrt(float* in, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    // Loop unrolling for potential performance improvement
    for (; tid < size; tid += stride) {
        if (tid < size) out[tid] = sqrt(in[tid]);
        tid += stride;
        if (tid < size) out[tid] = sqrt(in[tid]);
        tid += stride;
        if (tid < size) out[tid] = sqrt(in[tid]);
        tid += stride;
        if (tid < size) out[tid] = sqrt(in[tid]);
    }
}