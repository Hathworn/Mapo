#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_add(float* in1, float* in2, float* out, int size) {
    // Calculate global index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unrolling loop for better performance
    int stride = gridDim.x * blockDim.x * 4;
    for (; tid < size; tid += stride) {
        if (tid < size) out[tid] = in1[tid] + in2[tid];
        if (tid + blockDim.x < size) out[tid + blockDim.x] = in1[tid + blockDim.x] + in2[tid + blockDim.x];
        if (tid + 2 * blockDim.x < size) out[tid + 2 * blockDim.x] = in1[tid + 2 * blockDim.x] + in2[tid + 2 * blockDim.x];
        if (tid + 3 * blockDim.x < size) out[tid + 3 * blockDim.x] = in1[tid + 3 * blockDim.x] + in2[tid + 3 * blockDim.x];
    }
}