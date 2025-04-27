#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void THCudaTensor_kernel_renorm(float *data, const float value, const long size, const float maxnorm)
{
    __shared__ float buffer[32];
    long tx = threadIdx.x;
    long bx = blockIdx.x;
    long step = blockDim.x;
    float *row = data + size * bx;
    
    // Initialize buffer and local norm
    buffer[tx] = 0;
    float local_norm = 0;

    // Compute partial norms
    for (long i = tx; i < size; i += step) {
        local_norm += pow(fabs(row[i]), value);
    }
    buffer[tx] = local_norm;

    // Reduce (find total norm)
    for (unsigned int stride = blockDim.x >> 1; stride > 0; stride >>= 1) {
        __syncthreads();
        if (tx < stride) {
            buffer[tx] += buffer[tx + stride];
        }
    }

    // Clip and renormalize if necessary
    __syncthreads();
    if (tx == 0) {
        float norm = pow(buffer[0], 1 / value);
        if (norm > maxnorm) {
            norm = maxnorm / (norm + 1e-7);
            buffer[0] = norm; // Store renormalization factor in shared memory
        } else {
            buffer[0] = 1; // No renormalization needed
        }
    }
    __syncthreads();

    // Apply renormalization
    for (long i = tx; i < size; i += step) {
        row[i] *= buffer[0];
    }
}