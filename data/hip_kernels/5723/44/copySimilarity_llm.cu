#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copySimilarity(float* similarities, int active_slices, int slices, int* activeMask, int target, int source)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Check if within bounds
    if (i < active_slices) {
        int slice = activeMask[i];
        // Efficient memory access using slice index
        similarities[target * slices + slice] = similarities[source * slices + slice];
    }
}