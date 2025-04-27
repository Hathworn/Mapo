#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define GAUSSIAN_KERNEL_SIZE 3
#define SOBEL_KERNEL_SIZE 5
#define TILE_WIDTH 32
#define SMEM_SIZE 128

__global__ void lowHysterisis(int width, int height, float *d_nonMax, float* d_highThreshHyst, float lowThreshold, float *d_lowThreshHyst) {
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;

    if ((ix > 0) && (ix < (width - 1)) && (iy > 0) && iy < (height - 1)) {
        int tid = iy * width + ix;

        d_lowThreshHyst[tid] = d_highThreshHyst[tid];

        if (d_highThreshHyst[tid] == 1) {
            // Precompute neighbor indices
            int neighbors[8] = {
                tid + 1,       // eastN
                tid - 1,       // westN
                tid - width,   // northN
                tid + width,   // southN
                tid + width + 1,  // southEastN
                tid - width + 1,  // northEastN
                tid + width - 1,  // southWestN
                tid - width - 1   // northWestN
            };
            
            // Loop through neighbors
            for (int i = 0; i < 8; ++i) {
                if (d_nonMax[neighbors[i]] > lowThreshold) {
                    d_lowThreshHyst[neighbors[i]] = 1.0f;
                }
            }
        }
    }
}