#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void encode(char *encodedText, char *decodedText) {
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Pre-calculate start positions and avoid recalculating inside the loop
    int startEncoded = id * 101;
    int startDecoded = id * 4;
    int finish = startEncoded + 100;

    // Bound check for valid thread ID
    if (id < 15360) {
        for (int t = startEncoded; t < finish; t++) {
            // Inline calculation, reducing unnecessary memory accesses
            if (encodedText[t] == ',') {
                decodedText[startDecoded++] = encodedText[t + 1];
            }
        }
    }
}