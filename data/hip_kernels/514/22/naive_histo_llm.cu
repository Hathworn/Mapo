#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void optimized_histo(int *d_bins, const int *d_in, const int BIN_COUNT)
{
    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int myItem = d_in[myId];

    // Use atomic operation to prevent race condition
    atomicAdd(&d_bins[myItem % BIN_COUNT], 1);
}