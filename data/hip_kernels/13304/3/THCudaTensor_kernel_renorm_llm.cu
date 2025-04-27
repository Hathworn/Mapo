#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void THCudaTensor_kernel_renorm(float *data, const float value, const long size, const float maxnorm)
{
    __shared__ float buffer[32];
    long tx = threadIdx.x;
    long bx = blockIdx.x;
    long step = blockDim.x;

    // Use a pointer to the current row
    float *row = data + size * bx;
    buffer[tx] = 0.0f;

    // Calculate local sums in parallel
    for (long i = tx; i < size; i += step)
    {
        buffer[tx] += powf(fabsf(row[i]), value);
    }
    
    // Perform parallel reduction within block
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        __syncthreads(); // Ensure all threads have written their sums
        if (tx < stride)
        {
            buffer[tx] += buffer[tx + stride];
        }
    }
    
    // Normalize only if the first thread
    if (tx == 0)
    {
        float norm = powf(buffer[0], 1.0f / value);
        if (norm > maxnorm)
        {
            norm = maxnorm / (norm + 1e-7f);
            buffer[0] = norm; // Store normalization factor for reuse
        }
    }

    __syncthreads(); // Ensure normalization factor is computed

    // Renormalize if needed
    if (buffer[0] < 1.0f) // Check if normalization factor is computed
    {
        for (long i = tx; i < size; i += step)
        {
            row[i] *= buffer[0];
        }
    }
}