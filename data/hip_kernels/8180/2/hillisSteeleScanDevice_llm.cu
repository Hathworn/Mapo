#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

__global__ void hillisSteeleScanDevice(int *d_array, int numberOfElements, int *d_tmpArray, int moveIndex)
{
    int index = threadIdx.x + blockDim.x * blockIdx.x;
    // Check if the index is within bounds
    if (index >= numberOfElements)
    {
        return;
    }
    // Load data to temporary array
    d_tmpArray[index] = d_array[index];
    // Perform the scan operation if valid
    if (index >= moveIndex)
    {
        d_tmpArray[index] += d_array[index - moveIndex];
    }
}