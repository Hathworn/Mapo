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

    // Calculate norm in parallel using shared memory
    for (long i = tx; i < size; i += step)
    {
        buffer[tx] += powf(fabsf(row[i]), value);
    }

    // Parallel reduction in shared memory
    for (unsigned int stride = blockDim.x >> 1; stride > 0; stride >>= 1)
    {
        __syncthreads();
        if (tx < stride)
        {
            buffer[tx] += buffer[tx + stride];
        }
    }
    __syncthreads();

    // Check norm and renormalize if necessary
    if (tx == 0)
    {
        float norm = powf(buffer[0], 1.0f / value);
        buffer[0] = (norm > maxnorm) ? maxnorm / (norm + 1e-7f) : 1.0f;
    }
    __syncthreads();
    
    // Apply renormalization
    float scaling_factor = buffer[0];
    for (long i = tx; i < size; i += step)
    {
        if (scaling_factor != 1.0f) 
        {
            row[i] *= scaling_factor;
        }
    }
}