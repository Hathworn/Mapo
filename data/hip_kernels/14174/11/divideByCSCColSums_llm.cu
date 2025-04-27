#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void divideByCSCColSums(const float *values, const int *colPointers, float *pixels, const size_t n)
{
    const size_t idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx >= n) return;

    // Use shared memory to minimize global memory access
    __shared__ float sharedWeight;

    // Each thread calculates its weight
    float weight = 0.0f;
    for (size_t ridx = colPointers[idx]; ridx < colPointers[idx + 1]; ++ridx)
    {
        weight += values[ridx];
    }

    // Store weight in shared memory for subsequent access
    sharedWeight = weight;
    __syncthreads();

    // Divide pixel value by the accumulated weight in shared memory
    pixels[idx] /= sharedWeight + 1e-6f;
}