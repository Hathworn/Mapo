#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void segCountSum(int *counter, int *segcounter, const int countlength)
{
    unsigned int xIndex = blockDim.x * blockIdx.x + threadIdx.x;

    // Use grid-stride loop for better utilization of GPU resources
    for (int idx = xIndex; idx < countlength; idx += blockDim.x * gridDim.x)
    {
        int sum = 0;
        for (int jj = 0; jj < countlength; jj++)
        {
            sum += segcounter[idx + jj * countlength];
        }
        counter[idx] = sum;
    }
}