#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void NodesApplyTramplingEffectKernel(float* target, float* distanceToPath, int graphW, int graphH, float pathThickness, float tramplingCoefficient)
{
    // Calculate global indexes with boundary adjustments
    int i = blockIdx.x * blockDim.x + threadIdx.x + 1;
    int j = blockIdx.y * blockDim.y + threadIdx.y + 1;

    // Optimize boundary check and computation
    if(i <= graphW && j <= graphH) {
        int index = i + j * (graphW + 2);
        float t = distanceToPath[index];

        // Limit 't' within [0, 1] after normalizing with path thickness
        t = max(0.0f, min(1.0f, fabsf(t / pathThickness)));

        // Cubic parabola computation for trampling effect
        t = t * (t * (-4 * t + 6) - 3) + 1;

        // Atomic addition on target element with trampling coefficient
        atomicAdd(&target[index], t * tramplingCoefficient);
    }
}