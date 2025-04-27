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

    // Calculate norm (each thread processes part of the row)
    for (long i = tx; i < size; i += step)
    {
        buffer[tx] += powf(fabsf(row[i]), value);
    }

    // Reduce using shared memory (optimize reduction pattern)
    __syncthreads();
    for (unsigned int stride = blockDim.x >> 1; stride > 0; stride >>= 1)
    {
        if (tx < stride)
        {
            buffer[tx] += buffer[tx + stride];
        }
        __syncthreads();
    }

    // Clip norms and renormalize if necessary (only first thread needs to do it)
    if (tx == 0)
    {
        float norm = powf(buffer[0], 1 / value);
        if (norm > maxnorm)
        {
            norm = maxnorm / (norm + 1e-7f);
            buffer[0] = norm;  // Store norm for reuse
        }
        else
        {
            buffer[0] = 1.0f;  // No renormalization needed
        }
    }
    __syncthreads();

    // Apply renormalization
    for (long i = tx; i < size; i += step)
    {
        row[i] *= buffer[0];
    }
}