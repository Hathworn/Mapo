#include "hip/hip_runtime.h"
#include "includes.h"

#define TILE_WIDTH 32

struct event_pair
{
    hipEvent_t start;
    hipEvent_t end;
}

__global__ void GPU_convolution(float *channel, float *mask, float *result, int dimMask, int dimW, int dimH) {
    // Cache mask to shared memory for faster access
    __shared__ float sharedMask[dimMask * dimMask];
    if (threadIdx.y * dimMask + threadIdx.x < dimMask * dimMask) {
        sharedMask[threadIdx.y * dimMask + threadIdx.x] = mask[threadIdx.y * dimMask + threadIdx.x];
    }
    __syncthreads();

    int bx = blockIdx.x;
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    int Row = by * TILE_WIDTH + ty;
    int Col = bx * TILE_WIDTH + tx;

    int nidRow = Row - dimMask / 2;
    int nidCol = Col - dimMask / 2;

    int tid = Row * dimW + Col;

    // Use temporary variable to avoid repeated global memory access
    float pixelValue = 0.0f;

    // Only compute if within bounds
    if (Row < dimH && Col < dimW) {
        for (int i = 0; i < dimMask; ++i) {
            int x = nidRow + i;
            for (int j = 0; j < dimMask; ++j) {
                int y = nidCol + j;
                if (x >= 0 && y >= 0 && x < dimH && y < dimW) {
                    pixelValue += sharedMask[i * dimMask + j] * channel[x * dimW + y];
                }
            }
        }
        // Clamp final value
        result[tid] = fminf(fmaxf(pixelValue, 0.0f), 255.0f);
    }
}