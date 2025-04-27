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

    // Calculate norm of axis in parallel
    for (long i = tx; i < size; i += step)
    {
        buffer[tx] += powf(fabsf(row[i]), value);
    }

    // Reduction using parallel reduction
    for (unsigned int stride = blockDim.x >> 1; stride > 0; stride >>= 1)
    {
        __syncthreads();
        if (tx < stride)
        {
            buffer[tx] += buffer[tx + stride];
        }
    }

    // Clip norms after complete reduction
    __syncthreads();
    if (tx == 0)
    {
        float norm = powf(buffer[0], 1.0f / value);
        if (norm > maxnorm)
        {
            norm = maxnorm / (norm + 1e-7f);
            buffer[0] = norm; // Store scaling factor in shared buffer
        }
    }

    // Broadcast scaling factor and renormalize
    __syncthreads();
    if (buffer[0] != 1.0f)
    {
        for (long i = tx; i < size; i += step)
        {
            row[i] *= buffer[0];
        }
    }
}