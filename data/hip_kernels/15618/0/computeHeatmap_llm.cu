```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define WEIGHTSUM 273
#define BLOCK_SIZE 16

int * heatmap;
size_t heatmap_pitch;

int * scaled_heatmap;
size_t scaled_heatmap_pitch;

int * blurred_heatmap;
size_t blurred_heatmap_pitch;

float* d_desiredPositionX;
float* d_desiredPositionY;

__global__ void computeHeatmap(float* desiredAgentsX, float* desiredAgentsY, int n, int* heatmap, size_t heatmap_pitch, int* scaled_heatmap, size_t scaled_heatmap_pitch) {
    // Block row and column
    int blockRow = blockIdx.y;
    int blockCol = blockIdx.x;

    // Thread row and column block
    int row = threadIdx.y;
    int col = threadIdx.x;

    // x, y coordinate
    int x = blockCol * blockDim.x + col;
    int y = blockRow * blockDim.y + row;

    // Fade heatmap
    int* heatPoint = (int*)((char*)heatmap + y * heatmap_pitch) + x;
    *heatPoint = static_cast<int>(roundf((*heatPoint) * 0.80f));

    // Pull desiredAgentX and Y array from global to shared memory
    extern __shared__ float desiredPosition[];
    int tId = row * blockDim.x + col;

    for (int i = tId; i < n; i += blockDim.x * blockDim.y) {
        desiredPosition[i] = desiredAgentsX[i];
        desiredPosition[i + n] = desiredAgentsY[i];
    }

    __syncthreads();

    // Count how many agents want to go to each location
    for (int i = 0; i < n; i++) {
        int desiredX = static_cast<int>(desiredPosition[i]);
        int desiredY = static_cast<int>(desiredPosition[i + n]);

        if (x == desiredX && y == desiredY) {
            // Intensify heat for better color results
            atomicMin(heatPoint, 255 - 40);
            atomicAdd(heatPoint, 40);
        }
    }
}