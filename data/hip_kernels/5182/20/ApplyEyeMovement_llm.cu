#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ApplyEyeMovement(float* currentEye, float* stats, float moveFactor, float scaleFactor, float scaleBase)
{
    float sumWeights = stats[4];

    if (sumWeights > 0)
    {
        // Clamp the movement within bounds [-1, 1]
        currentEye[0] = fmaxf(fminf(moveFactor * stats[0], 1.0f), -1.0f);
        currentEye[1] = fmaxf(fminf(moveFactor * stats[1], 1.0f), -1.0f);

        // Compute variance with optimization for performance
        float variance = sqrtf((stats[2] + stats[3]) * 0.5f);

        // Clamp the scale within bounds [0, 1]
        currentEye[2] = fmaxf(fminf(variance * scaleFactor + scaleBase, 1.0f), 0.0f);
    }
    else
    {
        // Set default eye values when weights are zero
        currentEye[0] = 0.0f;
        currentEye[1] = 0.0f;
        currentEye[2] = 1.0f;
    }
}