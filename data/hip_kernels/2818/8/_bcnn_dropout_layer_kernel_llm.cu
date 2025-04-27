#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _bcnn_dropout_layer_kernel(float *input, int size, float *rand, float prob, float scale) {
    // Optimize to use shared memory and warp parallelism
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < size) {
        input[id] *= (rand[id] >= prob) * scale;
    }
}