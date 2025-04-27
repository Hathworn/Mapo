#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void periodicityPreservationGPU(int N, char* cells) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Efficient check to prevent excess threads
    if (i >= N + 2) return;

    // Copy first real row to bottom extra row
    if (i >= 1 && i <= N) {
        cells[(N + 2) * (N + 1) + i] = cells[(N + 2) + i];
        cells[i] = cells[(N + 2) * N + i];
    }

    // Copy first real column to right last extra column
    cells[i * (N + 2) + N + 1] = cells[i * (N + 2) + 1];
    cells[i * (N + 2)] = cells[i * (N + 2) + N];
}