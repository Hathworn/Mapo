#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void k1(float* g_dataA, float* g_dataB, int floatpitch, int width) {
    extern __shared__ float s_data[];
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    unsigned int y = blockIdx.y * blockDim.y + ty + 1;
    unsigned int x = blockIdx.x * blockDim.x + tx + 1;
    
    if (y >= width - 1 || x >= width - 1 || y < 1 || x < 1) return;

    int startCol = blockDim.x * blockIdx.x;
    int s_rowwidth = blockDim.x + 2;

    // Load shared memory inline
    #define LOAD_SHARED(idx, global_idx) s_data[idx] = g_dataA[global_idx]

    int mid_row = blockIdx.x * blockDim.x + 1 + floatpitch * blockIdx.y;
    int g_index0 = (mid_row - 1) * floatpitch + startCol + 1 + tx;
    int g_index1 = mid_row * floatpitch + startCol + 1 + tx;
    int g_index2 = (mid_row + 1) * floatpitch + startCol + 1 + tx;
    
    // Load shared memory with overlap
    LOAD_SHARED(tx + 1, g_index0);
    LOAD_SHARED(tx + s_rowwidth + 1, g_index1);
    LOAD_SHARED(tx + 2 * s_rowwidth + 1, g_index2);
    
    if (ty == 0) {
        LOAD_SHARED(tx, g_index0 - 1);
        LOAD_SHARED(tx + s_rowwidth, g_index1 - 1);
        LOAD_SHARED(tx + 2 * s_rowwidth, g_index2 - 1);
    }
    if (tx == blockDim.x - 1) {
        LOAD_SHARED(tx + 2, g_index0 + 1);
        LOAD_SHARED(tx + s_rowwidth + 2, g_index1 + 1);
        LOAD_SHARED(tx + 2 * s_rowwidth + 2, g_index2 + 1);
    }

    __syncthreads();

    // Compute the result for g_dataB
    int s_index0 = tx + 1;
    int s_index1 = s_index0 + s_rowwidth;
    int s_index2 = s_index1 + s_rowwidth;
    
    g_dataB[y * width + x] = (
        0.2f * s_data[s_index1] +
        0.1f * s_data[s_index0 - 1] +
        0.1f * s_data[s_index0 + 1] +
        0.1f * s_data[s_index1 + 1] +
        0.1f * s_data[s_index1 - 1] +
        0.1f * s_data[s_index2] +
        0.1f * s_data[s_index2 - 1] +
        0.1f * s_data[s_index2 + 1]
    ) * 0.95f;
}