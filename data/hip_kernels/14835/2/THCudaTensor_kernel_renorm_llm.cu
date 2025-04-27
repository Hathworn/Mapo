#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_renorm(float *data, const float value, const long size, const float maxnorm)
{
    __shared__ float buffer[32];
    long tx = threadIdx.x;
    long bx = blockIdx.x;
    long step = blockDim.x;
    float *row = data + size * bx;

    // Initialize buffer for each thread
    buffer[tx] = 0;

    // Compute partial norms
    for (long i = tx; i < size; i += step)
    {
        buffer[tx] += powf(fabsf(row[i]), value);
    }

    // Reduce within block
    for (unsigned int stride = blockDim.x >> 1; stride > 0; stride >>= 1)
    {
        __syncthreads();
        if (tx < stride)
        {
            buffer[tx] += buffer[tx + stride];
        }
    }

    // Renormalize if necessary
    __syncthreads();
    if (tx == 0)
    {
        float norm = powf(buffer[0], 1 / value);
        if (norm > maxnorm)
        {
            float scale = maxnorm / (norm + 1e-7f);
            buffer[0] = scale; // Store scale factor for other threads
        }
        else
        {
            buffer[0] = 1.0f; // No scaling needed
        }
    }
    __syncthreads();

    float scale = buffer[0];
    if (scale < 1.0f)
    {
        for (long i = tx; i < size; i += step)
        {
            row[i] *= scale;
        }
    }
}