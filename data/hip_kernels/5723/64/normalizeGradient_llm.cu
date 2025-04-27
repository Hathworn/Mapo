```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalizeGradient(float* gradient, int* activeMask, int activePatches, int patches)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i >= activePatches) return;

    int patch = activeMask[i];

    // Load norm value once to avoid multiple memory access
    float norm = gradient[6 * patches + patch];
    if (norm > 0)
        norm = 1.0f / sqrtf(norm);

    // Use loop unrolling for efficiency
    gradient[0 * patches + patch] *= norm;
    gradient[1 * patches + patch] *= norm;
    gradient[2 * patches + patch] *= norm;
    gradient[3 * patches + patch] *= norm;
    gradient[4 * patches + patch] *= norm;
    gradient[5 * patches + patch] *= norm;
}