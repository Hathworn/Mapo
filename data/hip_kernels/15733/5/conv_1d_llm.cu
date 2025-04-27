#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conv_1d(int* a, int* c, int n) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure threads only compute valid output elements
    if (id < n) {
        int r = MASK_LEN / 2;
        int start = id - r;
        int temp = 0;
        
        // Use shared memory for mask
        __shared__ int sharedMask[MASK_LEN];
        if (threadIdx.x < MASK_LEN) {
            sharedMask[threadIdx.x] = mask[threadIdx.x];
        }
        __syncthreads();

        // Calculate convolution with bounds check
        for (int j = 0; j < MASK_LEN; j++) {
            if ((start + j >= 0) && (start + j < n)) {
                temp += a[start + j] * sharedMask[j];
            }
        }
        c[id] = temp;
    }
}