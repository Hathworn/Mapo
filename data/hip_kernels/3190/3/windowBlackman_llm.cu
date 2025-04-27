#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void windowBlackman(float* idata, int length)
{
    int tidx = threadIdx.x + blockIdx.x * blockDim.x;
    if (tidx < length)
    {
        // Precompute reused expressions to enhance performance
        float factor = static_cast<float>(tidx) / (length - 1);
        float cosTerm = cos(2 * PI_F * factor);
        float sinTerm = sin(4 * PI_F * factor);
        
        // Compute windowed value using precomputed terms
        idata[tidx] = 0.37 * cosTerm + 0.08 * sinTerm;
    }
}