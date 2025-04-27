#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kern_BlurBuffer(float* input, float* output, int size, int spread, int dim)
{
    int idx = CUDASTDOFFSET;
    if (idx < size) { // Ensure index is within bounds
        int x = (idx / spread) % dim;
        float curr = input[idx];
        float down = (idx - spread >= 0) ? input[idx - spread] : curr; // Use curr if out of bounds
        float up = (idx + spread < size) ? input[idx + spread] : curr; // Use curr if out of bounds
        float newVal = 0.7865707f * curr + 0.1064508f * (down + up);
        output[idx] = newVal;
    }
}