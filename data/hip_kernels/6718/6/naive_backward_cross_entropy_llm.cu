#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void naive_backward_cross_entropy(float *in, int *one_hot_classes, float inv_batches, int size, float *out)
{
    int bid = blockIdx.x * blockDim.x + threadIdx.x;
    if (bid < size) {
        // Simplified division by using pre-calculated reciprocal
        out[bid] = (in[bid] - one_hot_classes[bid]) * inv_batches;
    }
}