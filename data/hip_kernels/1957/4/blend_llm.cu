#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void blend(float *cmap, float* oldd, float* newd, float weight, int *params)
{
    // Calculate single thread's global index once
    int ax = blockIdx.x * blockDim.x + threadIdx.x;
    int ay = blockIdx.y * blockDim.y + threadIdx.y;

    // Retrieve parameters to minimize repeated access
    int ch = params[0];
    int ah = params[1];
    int aw = params[2];
    int slice_a = ah * aw;
    int pitch_a = aw;

    // Use constant memory for often used constants
    const float thre = 0.05;

    // Check boundary once at the beginning
    if (ax < aw && ay < ah)
    {
        int idx = ay * pitch_a + ax;           // Compute index outside the loop
        float fa = cmap[idx];
        fa = (fa < thre) ? 0.0f : weight;      // Use conditional operator

        for (int i = 0; i < ch; i++)
        {
            int data_idx = i * slice_a + idx;  // Compute data index once
            float old_val = oldd[data_idx];
            float new_val = newd[data_idx];
            newd[data_idx] = old_val * fa + new_val * (1.0f - fa); // Combine computations
        }
    }
}