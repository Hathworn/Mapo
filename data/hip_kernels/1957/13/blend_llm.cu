#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void blend(float *cmap, float* oldd, float* newd, float weight, int *params)
{
    // Calculate global thread indices
    int ax = blockIdx.x * blockDim.x + threadIdx.x;
    int ay = blockIdx.y * blockDim.y + threadIdx.y;

    // Unpack parameters to local variables
    int ch = params[0];
    int ah = params[1];
    int aw = params[2];

    int slice_a = ah * aw;
    int pitch_a = aw;

    float thre = 0.05; // Threshold value

    if (ax < aw && ay < ah) // Check bounds within the image
    {
        float fa = cmap[ay * pitch_a + ax];

        // Conditionally set blending factor
        fa = (fa < thre) ? 0.0f : weight;

        int baseIndex = ay * pitch_a + ax; // Base index for slice

        // Unroll loop to optimize multiple channel processing
        #pragma unroll
        for (int i = 0; i < ch; i++)
        {
            int idx = i * slice_a + baseIndex;
            newd[idx] = oldd[idx] * fa + newd[idx] * (1.0f - fa);
        }
    }
}