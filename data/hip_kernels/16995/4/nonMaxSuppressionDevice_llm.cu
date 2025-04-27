#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX(a, b) ((a) > (b) ? (a) : (b))

#define GAUSSIAN_KERNEL_SIZE 3
#define SOBEL_KERNEL_SIZE 5
#define TILE_WIDTH 32
#define SMEM_SIZE 128

__global__ void nonMaxSuppressionDevice(int width, int height, float *d_gradientX, float *d_gradientY, float* d_gradientMag, float* d_nonMax) {
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;

    if (ix < width && iy < height) {
        int tid = iy * width + ix;

        // Read gradient magnitudes and gradients
        float d_gradientMag_tid = d_gradientMag[tid];
        float d_gradientXT = d_gradientX[tid];
        float d_gradientYT = d_gradientY[tid];

        float tanYX, magB, magA;

        // Handle boundary conditions: top/bottom edges and left/right edges
        if (ix == 0 || ix == width - 1 || iy == 0 || iy == height - 1) {
            d_nonMax[tid] = 0;
        } else {
            if (d_gradientMag_tid == 0) {
                d_nonMax[tid] = 0;
            } else {
                int offset1, offset2;
                float tanYX, magA, magB;
                
                // Calculate direction and potential offsets
                if (d_gradientXT >= 0) {
                    if (d_gradientYT >= 0) {
                        if (d_gradientXT >= d_gradientYT) { // East of South-East
                            tanYX = d_gradientYT / d_gradientXT;
                            offset1 = 1;
                            offset2 = width + 1;
                        } else { // South of South-East
                            tanYX = d_gradientXT / d_gradientYT;
                            offset1 = width;
                            offset2 = width + 1;
                        }
                    } else {
                        if (d_gradientXT >= -d_gradientYT) { // East of North-East
                            tanYX = -d_gradientYT / d_gradientXT;
                            offset1 = 1;
                            offset2 = -width + 1;
                        } else { // North of North-East
                            tanYX = d_gradientXT / -d_gradientYT;
                            offset1 = width;
                            offset2 = width - 1;
                        }
                    }
                } else {
                    if (d_gradientYT >= 0) {
                        if (d_gradientYT >= -d_gradientXT) { // South of South-West
                            tanYX = -d_gradientXT / d_gradientYT;
                            offset1 = width;
                            offset2 = width - 1;
                        } else { // West of South-West
                            tanYX = d_gradientYT / -d_gradientXT;
                            offset1 = -1;
                            offset2 = width - 1;
                        }
                    } else {
                        if (d_gradientYT >= d_gradientXT) { // West of North-West
                            tanYX = d_gradientYT / d_gradientXT;
                            offset1 = -1;
                            offset2 = -width - 1;
                        } else { // North of North-West
                            tanYX = d_gradientXT / d_gradientYT;
                            offset1 = width;
                            offset2 = width + 1;
                        }
                    }
                }

                // Compute magnitude interpolations
                magA = (1 - tanYX) * d_gradientMag[tid + offset1] + tanYX * d_gradientMag[tid + offset2];
                magB = (1 - tanYX) * d_gradientMag[tid - offset1] + tanYX * d_gradientMag[tid - offset2];

                // Perform non-maximum suppression
                d_nonMax[tid] = (d_gradientMag_tid >= magA && d_gradientMag_tid >= magB) ? d_gradientMag_tid : 0;
            }
        }
    }
}