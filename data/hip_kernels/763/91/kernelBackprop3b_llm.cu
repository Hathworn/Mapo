#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelBackprop3b(float *delta_nabla_b, int b_off, float *zs) {
    // Use shared memory to reduce redundant computations
    __shared__ float shared_zs[256]; // Assuming max 256 threads per block

    int idx = threadIdx.x;
    shared_zs[idx] = zs[idx];
    __syncthreads();

    // Calculate sigmoid only once
    float sigmoid = 1.0f / (1.0f + expf(-shared_zs[idx]));
    delta_nabla_b[b_off + idx] *= sigmoid * (1.0f - sigmoid);
}