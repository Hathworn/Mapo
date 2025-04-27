#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MarkMerges(int size, int* desiredMerges, int* merging, int* mergesToMake, int* incomplete) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        int desiredMerge = desiredMerges[idx];

        // Check if merger is valid and reciprocal
        if (desiredMerge >= 0 && desiredMerges[desiredMerge] == idx) {
            // Use ternary operator for concise conditionals
            int mergeIndex = desiredMerge > idx ? desiredMerge : idx;
            int targetIndex = desiredMerge > idx ? idx : desiredMerge;

            mergesToMake[mergeIndex] = targetIndex;
            merging[idx] = 1;
            merging[desiredMerge] = 1;
        } else if (desiredMerge >= 0) {
            incomplete[0] = 1; // Mark incomplete for further checks
        }
    }
}