#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"

// Optimized Kernel Average with Depth
__global__ void AVERAGE_DEPTH_1D(int envSizeX, int envSizeY, float* envData, int depth) {
    int tidX = blockIdx.x * blockDim.x + threadIdx.x;
    int tidY = blockIdx.y * blockDim.y + threadIdx.y;

    float moyenne = 0;
    int nbNombre = 0;

    // Check if thread is within bounds
    if (tidX < envSizeX && tidY < envSizeY) {
        // Iterate over neighborhood region
        for (int l = -depth; l <= depth; l++) {
            int lIndex = (tidX + l + envSizeX) % envSizeX; // Use modulo for circular boundary

            for (int k = -depth; k <= depth; k++) {
                int kIndex = (tidY + k + envSizeY) % envSizeY; // Use modulo for circular boundary

                float val = envData[envSizeX * lIndex + kIndex]; // Access data directly
                if (val != -1) {
                    moyenne += val;
                    nbNombre++;
                }
            }
        }

        // Calculate average if count is non-zero
        if (nbNombre != 0) {
            envData[envSizeX * tidX + tidY] = moyenne / nbNombre;
        }
    }
    __syncthreads();
}