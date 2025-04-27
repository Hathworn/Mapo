#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void devInverseReindexInt3Bool(int N, int3 *destArray, int3 *srcArray, unsigned int *reindex, int realSize, int nDims, int maxValue, bool ignoreValue)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    while (i < N) {
        // Unrolled loop and merged common logic for x, y, z
        for (unsigned int n = 0; n < nDims; n++) {
            int3 src = srcArray[i + n * realSize];
            int3 ret = make_int3(-1, -1, -1); // Initialize all to -1
            int addValue;
            if (src.x != -1 || !ignoreValue) {
                addValue = 0;
                src.x = ((src.x % maxValue) + maxValue) % maxValue; // Normalize value within bounds
                ret.x = (int)reindex[src.x] + addValue;
            }
            if (src.y != -1 || !ignoreValue) {
                addValue = 0;
                src.y = ((src.y % maxValue) + maxValue) % maxValue;
                ret.y = (int)reindex[src.y] + addValue;
            }
            if (src.z != -1 || !ignoreValue) {
                addValue = 0;
                src.z = ((src.z % maxValue) + maxValue) % maxValue;
                ret.z = (int)reindex[src.z] + addValue;
            }
            destArray[i + n * realSize] = ret;
        }
        i += gridDim.x * blockDim.x;
    }
}