#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void devInverseReindexInt2Bool(int N, int2 *destArray, int2 *srcArray, unsigned int *reindex, int realSize, int nDims, int maxValue, bool ignoreValue)
{
    int i = blockIdx.x*blockDim.x + threadIdx.x;
    int totalThreads = gridDim.x * blockDim.x;

    // Loop over dimensions with stride to improve parallel work distribution
    for (unsigned int n = 0; n < nDims; n++) {
        while (i < N) {
            int ret = -1;
            int tmp = srcArray[i + n*realSize].x;
            if (tmp != -1 || ignoreValue == false) {
                ret = tmp % maxValue;  // Perform modulo operation directly
                if (ret < 0) ret += maxValue;  // Adjust negative numbers
                ret = (int) reindex[ret] + (tmp / maxValue) * maxValue;  // Calculate final index with offset
            }
            destArray[i + n*realSize].x = ret;

            ret = -1;
            tmp = srcArray[i + n*realSize].y;
            if (tmp != -1 || ignoreValue == false) {
                ret = tmp % maxValue;  // Perform modulo operation directly
                if (ret < 0) ret += maxValue;  // Adjust negative numbers
                ret = (int) reindex[ret] + (tmp / maxValue) * maxValue;  // Calculate final index with offset
            }
            destArray[i + n*realSize].y = ret;

            i += totalThreads;  // Move to the next index in the stride
        }
    }
}