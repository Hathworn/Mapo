#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kCumsum(float *mat, float *target, float *temp, unsigned int height) {
    const int thid = threadIdx.x;
    const int super_offset = blockIdx.x * height;

    // Adjust pointers for block offset
    target += super_offset;
    mat += super_offset;
    temp += super_offset;

    if (2 * thid < height) {
        int offset = 1;
        
        // Load input into shared memory
        temp[2 * thid] = mat[2 * thid];
        temp[2 * thid + 1] = mat[2 * thid + 1];

        // Build sum in place up the tree
        for (int d = height >> 1; d > 0; d >>= 1) {
            __syncthreads();
            if (thid < d) {
                int ai = offset * (2 * thid + 1) - 1;
                int bi = offset * (2 * thid + 2) - 1;
                temp[bi] += temp[ai];
            }
            offset *= 2;
        }

        // Clear the last element
        if (thid == 0) { temp[height - 1] = 0; }

        // Traverse down tree & build scan
        for (int d = 1; d < height; d *= 2) {
            offset >>= 1;
            __syncthreads();
            if (thid < d) {
                int ai = offset * (2 * thid + 1) - 1;
                int bi = offset * (2 * thid + 2) - 1;
                float t = temp[ai];
                temp[ai] = temp[bi];
                temp[bi] += t;
            }
        }
        __syncthreads();

        // Write results to device memory
        target[2 * thid] = temp[2 * thid];
        target[2 * thid + 1] = temp[2 * thid + 1];
    }
}