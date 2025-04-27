#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumScore(double *score, int full_size, int half_size)
{
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    for (int i = index; i < half_size; i += stride) {
        // Use conditional operator within the index check to prevent unnecessary memory accesses
        int neighbor_index = i + half_size;
        if (neighbor_index < full_size) {
            score[i] += score[neighbor_index];
        }
    }
}