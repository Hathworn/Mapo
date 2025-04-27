```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX_LEVELS 1000

__global__ void kernel_quicksort(int* values, int n) {
    // Avoid using complex stack operations by using shared memory
    __shared__ int sharedStart[MAX_LEVELS];
    __shared__ int sharedEnd[MAX_LEVELS];

    // Calculate the initial thread index
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx >= n) return; // Early exit if index is out of range

    int pivot, L, R;
    sharedStart[idx] = idx;
    sharedEnd[idx] = n - 1;

    while (idx >= 0) {
        L = sharedStart[idx];
        R = sharedEnd[idx];

        if (L < R) {
            pivot = values[L];
            // Optimize pivot comparison using registers
            int originalL = L, originalR = R;

            while (L < R) {
                while (values[R] >= pivot && L < R) R--;
                if (L < R) values[L++] = values[R];
                while (values[L] < pivot && L < R) L++;
                if (L < R) values[R--] = values[L];
            }
            values[L] = pivot;

            sharedStart[idx + 1] = L + 1;
            sharedEnd[idx + 1] = sharedEnd[idx];
            sharedEnd[idx] = L;

            // Swap if needed to keep processing the larger subarray first
            if (sharedEnd[idx] - sharedStart[idx] > sharedEnd[idx - 1] - sharedStart[idx - 1]) {
                int tmp = sharedStart[idx];
                sharedStart[idx] = sharedStart[idx - 1];
                sharedStart[idx - 1] = tmp;

                tmp = sharedEnd[idx];
                sharedEnd[idx] = sharedEnd[idx - 1];
                sharedEnd[idx - 1] = tmp;
            }
        }
        else {
            idx--;
        }
    }
}