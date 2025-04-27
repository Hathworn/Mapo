#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultDiagonal(float* mat, float* vec, float* tgtMat, unsigned int width) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate the stride for coalesced memory access
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use shared memory for better performance
    extern __shared__ float s_vec[];

    // Preload vector data into shared memory
    if (idx < width) {
        s_vec[idx] = vec[idx];
    }
    __syncthreads();

    // Process diagonal elements using efficient stride-based loop
    for (unsigned int i = idx; i < width; i += stride) {
        tgtMat[width * i + i] = mat[width * i + i] * s_vec[i];
    }
}