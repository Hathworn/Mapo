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

    // Calculate norm across axis
    for (long i = tx; i < size; i += step)
    {
        buffer[tx] += pow(fabs(row[i]), value);
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

    // Normalization and renormalization
    if (tx == 0)
    {
        float norm = pow(buffer[0], 1 / value);
        if (norm > maxnorm)
        {
            norm = maxnorm / (norm + 1e-7);
            buffer[0] = norm;
        }
        else
        {
            buffer[0] = 1.0f; // No renormalization needed
        }
    }

    __syncthreads();
    float normFactor = buffer[0];
    for (long i = tx; i < size; i += step)
    {
        row[i] *= normFactor;
    }
}