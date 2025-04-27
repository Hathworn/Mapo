#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copyGlobalRow(float *in, float *out, const int nx, const int ny)
{
    // Calculate a single thread's global index
    unsigned int globalIndex = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int stride = blockDim.x * gridDim.x;

    // Use a loop to process multiple elements per thread if necessary
    for (unsigned int globalPos = globalIndex; globalPos < nx * ny; globalPos += stride)
    {
        out[globalPos] = in[globalPos];
    }
}