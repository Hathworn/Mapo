#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencil_1d(int *in, int *out, int dim) {

    __shared__ int temp[BLOCK_SIZE + 2*RADIUS];

    int lindex = threadIdx.x + RADIUS;
    int gindex = threadIdx.x + blockDim.x * blockIdx.x;
    int stride = gridDim.x * blockDim.x;

    while (gindex < (dim + blockDim.x)) {

        // Efficiently load inputs into shared memory
        if (gindex < dim)
            temp[lindex] = in[gindex];
        else
            temp[lindex] = 0;

        if (threadIdx.x < RADIUS) {
            int left = gindex - RADIUS;
            int right = gindex + blockDim.x;

            // Load halo on the left
            temp[lindex - RADIUS] = (left >= 0) ? in[left] : 0;

            // Load halo on the right
            temp[lindex + blockDim.x] = (right < dim) ? in[right] : 0;
        }

        __syncthreads();

        // Perform the stencil operation
        int result = 0;
        #pragma unroll
        for (int offset = -RADIUS; offset <= RADIUS; offset++) {
            result += temp[lindex + offset];
        }

        // Store the result
        if (gindex < dim)
            out[gindex] = result;

        gindex += stride;

        __syncthreads();
    }
}