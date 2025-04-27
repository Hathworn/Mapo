#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeGPU1d(unsigned char *image1, unsigned char *image2, unsigned char *res, int pixels) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < pixels) {
        int idx = 3 * i;

        // Perform the average calculation with integer summation to avoid type casting
        res[idx + 2] = (unsigned char)((image1[idx + 2] + image2[idx + 2]) >> 1);
        res[idx + 1] = (unsigned char)((image1[idx + 1] + image2[idx + 1]) >> 1);
        res[idx    ] = (unsigned char)((image1[idx    ] + image2[idx    ]) >> 1);
    }
}