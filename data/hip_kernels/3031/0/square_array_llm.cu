#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void square_array(float *a, int N)
{
    // Calculate the unique index for this thread
    int idx = hipBlockIdx_x * hipBlockDim_x + hipThreadIdx_x;

    // Use a while loop to handle larger problem sizes beyond the grid dimensions
    while (idx < N) {
        a[idx] = a[idx] * a[idx]; // Square the element
        idx += hipBlockDim_x * hipGridDim_x; // Move to the next index for this thread
    }
}