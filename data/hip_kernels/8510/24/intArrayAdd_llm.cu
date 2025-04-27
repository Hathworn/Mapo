#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void intArrayAdd(int *size, const int *input, int *output, const int *inFreeArray, int *length) {
    // Calculate global index
    const long ix = threadIdx.x + blockIdx.x * (long)blockDim.x;
    const long stride = blockDim.x * gridDim.x; // Calculate stride for grid-stride loop

    // Use grid-stride loop for accessing array elements
    for (long index = ix; index < *size * *length; index += stride) {
        int arrayIndex = index / *length; // Determine the starting index for this thread in input/output arrays
        int elementIndex = index % *length; // Determine the specific element in the array

        // Add elements from input arrays
        output[arrayIndex * *length + elementIndex] = input[arrayIndex * *length + elementIndex] + inFreeArray[elementIndex];
    }
}