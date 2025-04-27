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

    // Unroll loop for efficiency
    for (long i = tx; i < size; i += step * 4)
    {
        float sum = 0;
        if (i < size) sum += powf(fabsf(row[i]), value);
        if (i + step < size) sum += powf(fabsf(row[i + step]), value);
        if (i + 2 * step < size) sum += powf(fabsf(row[i + 2 * step]), value);
        if (i + 3 * step < size) sum += powf(fabsf(row[i + 3 * step]), value);
        buffer[tx] += sum;
    }

    // Parallel reduction
    for (unsigned int stride = blockDim.x >> 1; stride > 0; stride >>= 1)
    {
        __syncthreads();
        if (tx < stride)
        {
            buffer[tx] += buffer[tx + stride];
        }
    }

    // Clip norms
    __syncthreads();
    float norm = pow(buffer[0], 1 / value);
    if (norm > maxnorm)
    {
        norm = maxnorm / (norm + 1e-7f);
        // Renormalize
        for (long i = tx; i < size; i += step)
        {
            row[i] *= norm;
        }
    }
}