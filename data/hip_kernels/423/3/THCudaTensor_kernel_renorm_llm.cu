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

    // Calculate norm for a block
    for (long i = tx; i < size; i += step)
    {
        buffer[tx] += powf(fabsf(row[i]), value);
    }
    
    // Reduce within the block
    for (unsigned int stride = blockDim.x >> 1; stride > 0; stride >>= 1)
    {
        __syncthreads();
        if (tx < stride)
        {
            buffer[tx] += buffer[tx + stride];
        }
    }

    // Normalize if necessary
    if (tx == 0)
    {
        float norm = powf(buffer[0], 1.0f / value);
        if (norm > maxnorm)
        {
            norm = maxnorm / (norm + 1e-7f);
            buffer[0] = norm;
        }
        else
        {
            buffer[0] = 1.0f;  // No need to renormalize
        }
    }

    __syncthreads();
    // Renormalize rows if needed
    for (long i = tx; i < size; i += step)
    {
        row[i] *= buffer[0];
    }
}