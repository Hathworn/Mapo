#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCKSIZE 256
#define RADIUS 1

__global__ void stencil_1D(int *in, int *out, int dim) {

    __shared__ int temp[BLOCKSIZE + 2 * RADIUS];

    int lindex = threadIdx.x + RADIUS;
    int gindex = threadIdx.x + blockDim.x * blockIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Optimize boundary checks and simplify logic
    while (gindex < dim) {
        temp[lindex] = (gindex < dim) ? in[gindex] : 0;

        if (threadIdx.x < RADIUS) {
            int left = gindex - RADIUS;
            int right = gindex + blockDim.x;

            temp[lindex - RADIUS] = (left >= 0) ? in[left] : 0;
            temp[lindex + blockDim.x] = (right < dim) ? in[right] : 0;
        }

        __syncthreads();

        // Simplified stencil computation
        int result = 0;
        for (int offset = -RADIUS; offset <= RADIUS; offset++) {
            result += temp[lindex + offset];
        }

        if (gindex < dim) out[gindex] = result;

        gindex += stride;
        __syncthreads();
    }
}