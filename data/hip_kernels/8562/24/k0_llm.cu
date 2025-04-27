#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void k0(float* g_dataA, float* g_dataB, int pitch, int width)
{
    // global thread(data) row index
    unsigned int i = blockIdx.y * blockDim.y + threadIdx.y + 1;

    // global thread(data) column index
    unsigned int j = blockIdx.x * blockDim.x + threadIdx.x + 1;

    // check the boundary
    if (i >= width - 1 || j >= width - 1 || i < 1 || j < 1) return;

    // Pre-calculate offsets to improve access efficiency
    unsigned int idx = i * pitch + j;
    unsigned int idxN = (i - 1) * pitch + j;
    unsigned int idxS = (i + 1) * pitch + j;
    unsigned int idxE = idx + 1;
    unsigned int idxW = idx - 1;
    unsigned int idxNE = idxN + 1;
    unsigned int idxNW = idxN - 1;
    unsigned int idxSE = idxS + 1;
    unsigned int idxSW = idxS - 1;

    // Perform calculation with pre-computed indices
    g_dataB[idx] = (
        0.2f * g_dataA[idx] +
        0.1f * g_dataA[idxN] +
        0.1f * g_dataA[idxNE] +
        0.1f * g_dataA[idxE] +
        0.1f * g_dataA[idxSE] +
        0.1f * g_dataA[idxS] +
        0.1f * g_dataA[idxSW] +
        0.1f * g_dataA[idxW] +
        0.1f * g_dataA[idxNW]
    ) * 0.95f;
}