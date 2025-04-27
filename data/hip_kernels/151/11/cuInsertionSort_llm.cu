#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuInsertionSort(float *dist, int width, int pitch, int height, int k) {
    int xIndex = blockIdx.x * blockDim.x + threadIdx.x;

    if (xIndex < width) {
        // Use registers for frequently accessed data
        float *p = dist + xIndex;
        float max_value = *p;

        // Part 1: Sort the first k elements
        for (int l = pitch; l < k * pitch; l += pitch) {
            float v = *(p + l);
            if (v < max_value) {
                int i = 0;

                // Improved loop with minimal iteration
                for (; i < l && *(p + i) <= v; i += pitch);

                // Use backward movement for better cache usage
                for (int j = l; j > i; j -= pitch)
                    *(p + j) = *(p + j - pitch);
                *(p + i) = v;
            }
            max_value = fmaxf(max_value, *(p + l)); // Use intrinsic function for max
        }

        // Part 2: Insert elements in the sorted k elements
        for (int l = k * pitch; l < height * pitch; l += pitch) {
            float v = *(p + l);
            if (v < max_value) {
                int i = 0;
                for (; i < k * pitch && *(p + i) <= v; i += pitch);

                for (int j = (k - 1) * pitch; j > i; j -= pitch)
                    *(p + j) = *(p + j - pitch);
                *(p + i) = v;
                max_value = *(p + (k - 1) * pitch);
            }
        }
    }
}