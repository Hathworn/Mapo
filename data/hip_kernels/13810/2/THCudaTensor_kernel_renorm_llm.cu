#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_renorm(float *data, const float value, const long size, const float maxnorm)
{
    __shared__ float buffer[32];
    long tx = threadIdx.x;
    long bx = blockIdx.x;
    long step = blockDim.x;
    float *row = data + size * bx;

    buffer[tx] = 0.0f;

    // Compute partial sums in parallel
    for (long i = tx; i < size; i += step) {
        buffer[tx] += powf(fabsf(row[i]), value);
    }

    // Parallel reduction to sum the buffer
    for (unsigned int stride = blockDim.x >> 1; stride > 0; stride >>= 1) {
        __syncthreads();
        if (tx < stride) {
            buffer[tx] += buffer[tx + stride];
        }
    }

    // Compute norm and renormalize if necessary
    if (tx == 0) {
        float norm = powf(buffer[0], 1.0f / value);
        if (norm > maxnorm) {
            float scale = maxnorm / (norm + 1e-7f);
            for (long i = 0; i < size; ++i) {
                row[i] *= scale;
            }
        }
    }
}