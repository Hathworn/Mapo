#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void devInverseReindex(int N, int *destArray, int *srcArray, unsigned int *reindex, int realSize, int nDims, int maxValue, bool ignoreValue)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    for (unsigned int n = 0; n < nDims; n++) {
        int idx = i;

        while (idx < N) {
            int ret = -1;
            int tmp = srcArray[idx + n * realSize];
            
            if (tmp != -1 || !ignoreValue) {
                
                // Normalize tmp to be within bounds [0, maxValue)
                int addValue = (tmp < 0) ? -((-tmp / maxValue) + 1) * maxValue : (tmp / maxValue) * maxValue;
                tmp -= addValue;
                
                // Adjust tmp if it is negative after normalization
                while (tmp < 0) {
                    tmp += maxValue;
                    addValue -= maxValue;
                }

                ret = (int) reindex[tmp] + addValue;
            }
            destArray[idx + n * realSize] = ret;

            idx += stride;
        }
    }
}