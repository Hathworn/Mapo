#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dirtyFixWindowsVarScaleKernel(float *xMin, float *xMax, float *yMin, float *yMax, const int size, const float h, const float w, const float minWidth) {

    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Simplify indexing calculation

    if (idx < 2 * size) {
        float paramMin, paramMax;

        bool isX = (idx < size); // Determine whether this thread works on x or y

        // Compute correct index for y
        int effectiveIdx = isX ? idx : idx - size;

        // Select appropriate bounds based on x or y
        float boundMin = isX ? -h + 1 : -w + 1;
        float boundMax = isX ? h - 1 : w - 1;
        float* arrayMin = isX ? xMin : yMin;
        float* arrayMax = isX ? xMax : yMax;

        // Calculate parameter min/max using selected bounds
        paramMin = max(boundMin, min(boundMax, arrayMin[effectiveIdx]));
        paramMax = max(boundMin, min(boundMax, arrayMax[effectiveIdx]));

        // Adjust parameters if necessary
        if (paramMin + minWidth - 0.99 > paramMax) {
            const float mean = 0.5f * (paramMin + paramMax);
            paramMin = mean - 0.5f * (minWidth - 0.9f);
            paramMax = mean + 0.5f * (minWidth - 0.9f);
        }

        // Save results to correct arrays
        arrayMin[effectiveIdx] = paramMin;
        arrayMax[effectiveIdx] = paramMax;
    }
}