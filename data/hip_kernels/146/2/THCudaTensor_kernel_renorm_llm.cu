#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_renorm(float *data, const float value, const long size, const float maxnorm)
{
    __shared__ float buffer[32];
    long tx = threadIdx.x;
    long bx = blockIdx.x;
    long step = blockDim.x;
    float *row = data + size * bx;

    buffer[tx] = 0;

    // Calculate the norm of the axis using parallel sum reduction
    for (long i = tx; i < size; i += step)
    {
        buffer[tx] += powf(fabsf(row[i]), value);
    }
    __syncthreads();

    // Using warp shuffle-based reduction for better efficiency
    for (int stride = warpSize / 2; stride > 0; stride /= 2)
    {
        buffer[tx] += __shfl_down_sync(0xFFFFFFFF, buffer[tx], stride);
    }
    if (tx % warpSize == 0) {
        atomicAdd(&buffer[0], buffer[tx]);
    }
    __syncthreads();

    // Clip norms and renormalize if necessary
    if (tx == 0) {
        float norm = powf(buffer[0], 1 / value);
        if (norm > maxnorm) {
            buffer[0] = maxnorm / (norm + 1e-7);
        } else {
            buffer[0] = 1.0f; // No renormalization needed
        }
    }
    __syncthreads();

    float renorm_factor = buffer[0];
    for (long i = tx; i < size; i += step)
    {
        row[i] *= renorm_factor;
    }
}