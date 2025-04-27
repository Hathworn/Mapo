#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
__global__ void bubble(unsigned int length, unsigned int parity, float* tab)
{
    // Calculate global thread ID
    int index = 2 * (threadIdx.x + blockDim.x * blockIdx.x);
    int leftElementID = index + parity;
    int rightElementID = index + parity + 1;

    // Check bounds and swap if out of order
    if (rightElementID < length)
    {
        float l = tab[leftElementID];
        float r = tab[rightElementID];
        if (r < l)
        {
            // Use temporary variable for swapping to avoid redundant load/store
            tab[leftElementID] = r;
            tab[rightElementID] = l;
        }
    }
}