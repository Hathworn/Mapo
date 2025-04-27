#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void blend(float *cmap, float* oldd, float* newd, float weight, int * params)
{
    int ax = blockIdx.x * blockDim.x + threadIdx.x;
    int ay = blockIdx.y * blockDim.y + threadIdx.y;
    
    int ch = params[0];
    int ah = params[1];
    int aw = params[2];
    
    int slice_a = ah * aw;
    int pitch_a = aw;
    
    float thre = 0.05;
    
    if (ax < aw && ay < ah)
    {
        float fa = cmap[ay * pitch_a + ax];
        // Use ternary for fa calculation, avoiding branching
        fa = (fa < thre) ? 0.0f : weight;
        
        for (int i = 0; i < ch; i++)
        {
            int idx = i * slice_a + ay * pitch_a + ax;
            // Precompute indices to reduce repetitive calculations
            // Blend old and new data with precomputed index
            newd[idx] = oldd[idx] * fa + newd[idx] * (1.0 - fa);
        }
    }
}