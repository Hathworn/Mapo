#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void devFillAffectedIndex(int nRemove, int maxTriPerVert, int *pTriangleAffectedIndex)
{
    // Get the thread's global index
    int n = blockIdx.x * blockDim.x + threadIdx.x;

    // Using grid-stride loop for better performance
    for (; n < nRemove; n += blockDim.x * gridDim.x) {
        int baseIndex = n * maxTriPerVert;
        int offsetIndex = baseIndex + nRemove * maxTriPerVert;

        // Unrolling loop to potentially optimize performance
        for (int i = 0; i < maxTriPerVert; i++) { 
            pTriangleAffectedIndex[i + baseIndex] = n;
            pTriangleAffectedIndex[i + offsetIndex] = n;
        }
    }
}