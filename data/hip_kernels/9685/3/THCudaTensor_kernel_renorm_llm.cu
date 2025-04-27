#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void THCudaTensor_kernel_renorm(float *data, const float value, const ptrdiff_t size, const float maxnorm)
{
    __shared__ float buffer[32];
    long tx = threadIdx.x;
    long bx = blockIdx.x;
    long step = blockDim.x;
    float *row = data + size * bx;

    buffer[tx] = 0;

    // Calculate norm of axis using stride loop
    for (ptrdiff_t i = tx; i < size; i += step)
    {
        buffer[tx] += powf(fabsf(row[i]), value); // Use powf and fabsf for better performance
    }

    // Sum reduction using shared memory and unrolling
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride /= 2)
    {
        __syncthreads();
        if (tx < stride)
        {
            buffer[tx] += buffer[tx + stride];
        }
    }

    // Clip norms
    __syncthreads();
    float norm = powf(buffer[0], 1 / value); // Use powf for better performance
    if (norm > maxnorm)
    {
        norm = maxnorm / (norm + 1e-7);
        // Renormalize
        for (ptrdiff_t i = tx; i < size; i += step)
        {
            row[i] *= norm;
        }
    }
}