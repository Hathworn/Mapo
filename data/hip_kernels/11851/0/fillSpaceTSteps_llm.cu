#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fillSpaceTSteps(int N, int T, float c, float dt, float dd, float *waveSpace, float *waveSpaceTMin1, float *waveSpaceTMin2)
{
    // Calculate the 2D grid position
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Shared memory for tile, assuming block size is small enough to fit
    extern __shared__ float sWaveSpaceTMin1[];

    // Load data to shared memory; boundaries will load incomplete tiles
    if (i < N && j < N) {
        int idxLocal = threadIdx.y * blockDim.x + threadIdx.x;
        sWaveSpaceTMin1[idxLocal] = waveSpaceTMin1[N * i + j];
    }
    __syncthreads();

    // Perform calculation if within bounds
    if (i < N && j < N) {
        float cSquaredDtDd = (c * c) * (dt / dd * dt / dd);

        float neighborSum = ((i + 1 < N) ? waveSpaceTMin1[N * (i + 1) + j] : 0.0f)
                         + ((i - 1 >= 0) ? waveSpaceTMin1[N * (i - 1) + j] : 0.0f)
                         + ((j - 1 >= 0) ? waveSpaceTMin1[N * i + (j - 1)] : 0.0f)
                         + ((j + 1 < N) ? waveSpaceTMin1[N * i + (j + 1)] : 0.0f)
                         - 4 * sWaveSpaceTMin1[threadIdx.y * blockDim.x + threadIdx.x];

        waveSpace[N * i + j] = 2 * sWaveSpaceTMin1[threadIdx.y * blockDim.x + threadIdx.x] - waveSpaceTMin2[N * i + j] + cSquaredDtDd * neighborSum;
    }
}