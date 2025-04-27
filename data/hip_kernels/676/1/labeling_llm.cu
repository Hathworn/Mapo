#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void labeling(const char *text, int *pos, int text_size) {
    // Calculate the global index for the current thread
    int index = blockDim.x * blockIdx.x + threadIdx.x; 

    // Check if the index is within bounds
    if (index >= text_size) {
        return;
    }

    // Initialize the position to zero
    pos[index] = 0;

    // Check if the current text character is a space or non-printable
    if (text[index] <= ' ') {
        return;
    }

    // Calculate distance to the last non-space character
    for (int k = index - 1; k >= 0; k--) {
        if (text[k] <= ' ') {
            pos[index] = index - k;
            return;
        }
    }

    // If no space before, the position is index + 1
    pos[index] = index + 1;
}