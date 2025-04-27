#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ApplyEyeMovement(float* currentEye, float* stats, float moveFactor, float scaleFactor, float scaleBase)
{
    // Read sumWeights and check its condition
    float sumWeights = stats[4];
    if (sumWeights > 0)
    {
        // Optimize by storing intermediate calculations in variables
        float clampedX = fmaxf(fminf(moveFactor * stats[0], 1.0f), -1.0f);
        float clampedY = fmaxf(fminf(moveFactor * stats[1], 1.0f), -1.0f);

        float combinedVariance = (stats[2] + stats[3]) * 0.5f;
        float variance = sqrtf(combinedVariance);

        float clampedZ = fmaxf(fminf(variance * scaleFactor + scaleBase, 1.0f), 0.0f);

        // Assign results
        currentEye[0] = clampedX;
        currentEye[1] = clampedY;
        currentEye[2] = clampedZ;
    }
    else
    {
        // Default condition values
        currentEye[0] = 0.0f;
        currentEye[1] = 0.0f;
        currentEye[2] = 1.0f;
    }
}