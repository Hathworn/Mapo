#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecSubFp32(float* __restrict__ in0, float* __restrict__ in1, float* __restrict__ out, int cnt)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int gridSize = blockDim.x * gridDim.x;

    // Loop over the input arrays with a stride equal to the grid size
    for (int i = tid; i < cnt; i += gridSize) {
        out[i] = in0[i] - in1[i];
    }
}