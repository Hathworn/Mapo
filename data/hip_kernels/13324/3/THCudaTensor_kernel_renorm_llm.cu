#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_renorm(float *data, const float value, const long size, const float maxnorm)
{
    extern __shared__ float buffer[]; // Use dynamic shared memory for better resource utilization
    long tx = threadIdx.x;
    long bx = blockIdx.x;
    long step = blockDim.x;
    float *row = data + size * bx;

    // Initialize buffer
    buffer[tx] = 0.0f;

    // Compute the norm of axis
    for (long i = tx; i < size; i += step)
    {
        buffer[tx] += powf(fabsf(row[i]), value);
    }

    // Reduction using shared memory
    __syncthreads();
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (tx < stride)
        {
            buffer[tx] += buffer[tx + stride];
        }
        __syncthreads();
    }

    // Normalization and renorm if necessary
    if (tx == 0)
    {
        float norm = powf(buffer[0], 1.0f / value);
        buffer[0] = (norm > maxnorm) ? (maxnorm / (norm + 1e-7f)) : 1.0f;
    }

    // Synchronize to ensure buffer[0] is updated
    __syncthreads();

    // Renormalize if required
    float norm = buffer[0];
    if (norm < 1.0f)
    {
        for (long i = tx; i < size; i += step)
        {
            row[i] *= norm;
        }
    }
}