#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculate_entropy(float *norm, float *entropy, int max, float sum, int size) {
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * max + ix;
    int tid = threadIdx.x;

    if (idx < size && norm[idx] != 0) {
        entropy[idx] = -(norm[idx] * log10f(norm[idx]));
    }
    __syncthreads(); // Ensure all threads have computed entropy

    // Optimize reduction using stride loop
    for (int stride = 1; stride < blockDim.x; stride *= 2) {
        if (tid % (2 * stride) == 0 && (idx + stride) < size) {
            entropy[idx] += entropy[idx + stride];
        }
        __syncthreads(); // Synchronize threads within the block
    }

    // Output result from the first thread of the block
    if (tid == 0) {
        printf("entropy %f\n", entropy[ix + iy * blockDim.x * gridDim.x]);
    }
}