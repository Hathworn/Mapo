#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void devInverseReindexInt3(int N, int3 *destArray, int3 *srcArray, int *reindex, int realSize, int nDims)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index

    for (unsigned int n = 0; n < nDims; n++) {
        int idx = i + n * realSize; // Calculate index for dimension n

        while (i < N) {
            // Efficient memory access using local variables
            int3 temp = srcArray[idx];

            // Avoid redundant accesses by using local variables
            destArray[idx].x = reindex[temp.x];
            destArray[idx].y = reindex[temp.y];
            destArray[idx].z = reindex[temp.z];

            i += gridDim.x * blockDim.x; // Update index for next iteration
            idx += gridDim.x * blockDim.x; // Update idx for next iteration
        }
    }
}