#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inputKernel2(float *x, int n, int N)
{
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;
    int idx = iy * NUM_OF_X_THREADS + ix;

    if (idx < N)
    {
        float value = (idx < n) ? ((float)idx * 2) - ((float)idx * (float)idx) : 0;
        // Use a single loop for initialization
        for(int i = 0; i < N; i++)
        {
            x[idx * N + i] = (i == 0) ? value : 0;
        }
    }
}