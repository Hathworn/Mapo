#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sobelEdgeDetectionSharedMem2(int *input, int *output, int width, int height, int thresh) {

    __shared__ int sharedMem[6][6]; // Use shared memory for input window

    int i_global = (blockIdx.x * blockDim.x + threadIdx.x) * 2;
    int j_global = (blockIdx.y * blockDim.y + threadIdx.y) * 2;

    int i_shared = threadIdx.x * 2 + 1; // Local indices for shared memory
    int j_shared = threadIdx.y * 2 + 1;

    // Boundary check
    if (i_global > 0 && j_global > 0 && i_global < width - 1 && j_global < height - 1) {
        // Load input into shared memory
        for (int dy = -1; dy <= 2; ++dy) {
            for (int dx = -1; dx <= 2; ++dx) {
                sharedMem[j_shared + dy][i_shared + dx] = input[width * (j_global + dy) + i_global + dx];
            }
        }

        __syncthreads();

        int sum1 = 0, sum2 = 0, magnitude;

        for (int xind = 1; xind <= 2; ++xind) {
            for (int yind = 1; yind <= 2; ++yind) {
                sum1 = sharedMem[j_shared + yind - 1][i_shared + xind + 1] - sharedMem[j_shared + yind - 1][i_shared + xind - 1]
                     + 2 * sharedMem[j_shared + yind][i_shared + xind + 1] - 2 * sharedMem[j_shared + yind][i_shared + xind - 1]
                     + sharedMem[j_shared + yind + 1][i_shared + xind + 1] - sharedMem[j_shared + yind + 1][i_shared + xind - 1];

                sum2 = sharedMem[j_shared + yind - 1][i_shared + xind - 1] + 2 * sharedMem[j_shared + yind - 1][i_shared + xind] + sharedMem[j_shared + yind - 1][i_shared + xind + 1]
                     - sharedMem[j_shared + yind + 1][i_shared + xind - 1] - 2 * sharedMem[j_shared + yind + 1][i_shared + xind] - sharedMem[j_shared + yind + 1][i_shared + xind + 1];

                magnitude = sum1 * sum1 + sum2 * sum2;

                // Write result to output
                if (magnitude > thresh)
                    output[(j_global + yind - 1) * width + (i_global + xind - 1)] = 255;
                else
                    output[(j_global + yind - 1) * width + (i_global + xind - 1)] = 0;
            }
        }
    }
}