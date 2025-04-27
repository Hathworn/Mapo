#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reverseArray(int *A, int *B) {
    int threadID = threadIdx.x;
    // Calculate the number of elements this thread will handle
    int elementsPerThread = ArraySize / blockDim.x;
    int start = threadID * elementsPerThread;
    int end = start + elementsPerThread - 1;

    // Use a more efficient loop structure with single comparison
    for (int i = 0; i < elementsPerThread; i++) {
        B[end - i] = A[start + i];
    }
}