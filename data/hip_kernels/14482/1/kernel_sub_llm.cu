#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_sub(char* newB, char* first, char* second, int size_biggest, int diff, int * size_newB) {
    int i = threadIdx.x;  // Simplified thread index retrieval
    if (i == 0) return;   // Skip processing for thread 0

    int tmp = 0;
    // Eliminate redundant loop: Threads handle one element each

    // Optimize boundary check and computation
    if (i - 1 - diff >= 0) {
        if (second[i - 1 - diff] != '+' && second[i - 1 - diff] != '-') {
            tmp = first[i - 1] - second[i - 1 - diff];
        }
    } else if (first[i - 1] != '+' && first[i - 1] != '-') {
        tmp = first[i - 1];
    }

    if (tmp < 0) {
        newB[i - 1]--;  // Simplified to directly decrement
        tmp += 10;      // Adjustment for negative tmp
    }
    
    newB[i] += tmp;     // Combine non-zero check into main operation
}