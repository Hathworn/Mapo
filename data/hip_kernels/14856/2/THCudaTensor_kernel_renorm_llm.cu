#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void THCudaTensor_kernel_renorm(float *data, const float value, const long size, const float maxnorm)
{
    __shared__ float buffer[32];
    const long tx = threadIdx.x;
    const long bx = blockIdx.x;
    const long step = blockDim.x;
    float *row = data + size * bx;

    // Initialize buffer with zero
    buffer[tx] = 0.0f;

    // Calculate partial norms in parallel
    for (long i = tx; i < size; i += step)
    {
        buffer[tx] += powf(fabsf(row[i]), value);
    }

    // Efficient parallel reduction using shared memory
    __syncthreads(); // Ensure all partial sums are done
    for (unsigned int stride = step / 2; stride > 0; stride >>= 1)
    {
        if (tx < stride)
        {
            buffer[tx] += buffer[tx + stride];
        }
        __syncthreads(); // Synchronize to ensure correct reduction
    }

    // Normalize the row based on the calculated norm
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
            buffer[0] = 1.0f; // No renorm required
        }
    }

    // Apply renormalization if needed
    __syncthreads(); // Ensure buffer[0] is ready
    for (long i = tx; i < size; i += step)
    {
        row[i] *= buffer[0];
    }
}