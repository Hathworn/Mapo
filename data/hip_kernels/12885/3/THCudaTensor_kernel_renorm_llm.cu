#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_kernel_renorm(float *data, const float value, const long size, const float maxnorm)
{
    extern __shared__ float buffer[]; // Use dynamic shared memory
    long tx = threadIdx.x;
    long bx = blockIdx.x;
    long step = blockDim.x;
    float *row = data + size * bx;

    float sum = 0.0f;

    // Compute partial sums
    for (long i = tx; i < size; i += step)
    {
        sum += pow(fabsf(row[i]), value);
    }
    buffer[tx] = sum;

    // Reduce sums
    __syncthreads();
    for (unsigned int stride = blockDim.x >> 1; stride > 0; stride >>= 1)
    {
        if (tx < stride)
        {
            buffer[tx] += buffer[tx + stride];
        }
        __syncthreads();
    }

    // Clip norms and renormalize if needed
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

    // Ensure all threads are synchronized
    __syncthreads();

    float normFactor = buffer[0];
    for (long i = tx; i < size; i += step)
    {
        row[i] *= normFactor;
    }
}