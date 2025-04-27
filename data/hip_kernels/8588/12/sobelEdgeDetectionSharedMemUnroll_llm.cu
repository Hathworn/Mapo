#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sobelEdgeDetectionSharedMemUnroll(int *input, int *output, int width, int height, int thresh) {

    __shared__ int shMem[4 * _TILESIZE_2 * _TILESIZE_2];

    int num = _UNROLL_;
    int size = num * _TILESIZE_2;

    int i = blockIdx.x * num * _TILESIZE_ + threadIdx.x * num;
    int j = blockIdx.y * num * _TILESIZE_ + threadIdx.y * num;

    int xind = num * threadIdx.x;
    int yind = num * threadIdx.y;

    for(int x = 0; x < num; x++) {
        for(int y = 0; y < num; y++) {
            // Load input data into shared memory
            shMem[size * (yind + y) + (xind + x)] = input[(j + y) * width + (i + x)];
        }
    }

    __syncthreads();

    if (xind > 0 && yind > 0 && xind < (size - 2) && yind < (size - 2)) {
        for(int x = 0; x < num; x++) {
            for(int y = 0; y < num; y++) {
                // Precompute frequently used array indices
                int baseX = xind + x;
                int baseY = yind + y;
                int loc = baseX + size * baseY;
                
                // Calculate sum1 using precomputed indices
                int sum1 = shMem[loc + 1 + size * (-1)] - shMem[loc - 1 + size * (-1)]
                         + 2 * shMem[loc + 1] - 2 * shMem[loc - 1]
                         + shMem[loc + 1 + size] - shMem[loc - 1 + size];

                // Calculate sum2 using precomputed indices
                int sum2 = shMem[loc - 1 + size * (-1)] + 2 * shMem[loc + size * (-1)] + shMem[loc + 1 + size * (-1)]
                         - shMem[loc - 1 + size] - 2 * shMem[loc + size] - shMem[loc + 1 + size];

                int magnitude = sum1 * sum1 + sum2 * sum2;

                int index = (j + y) * width + (i + x);

                // Apply threshold
                output[index] = (magnitude > thresh) ? 255 : 0;
            }
        }
    }
}