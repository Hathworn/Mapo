#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copySimilarity(float* similarities, int active_patches, int patches, int* activeMask, int target, int source)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i < active_patches) {
        int patch = activeMask[i];
        // Use shared memory to reduce global memory traffic
        __shared__ int sharedPatch;
        sharedPatch = patch;
        __syncthreads();
        similarities[target * patches + sharedPatch] = similarities[source * patches + sharedPatch];
    }
}