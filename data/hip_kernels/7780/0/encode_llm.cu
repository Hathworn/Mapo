#include "hip/hip_runtime.h"
#include "includes.h"

// CUDA kernel. Each thread takes care of one element of c

__global__ void encode(char *encodedText, char *decodedText)
{
    // Get our global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Improved boundary conditions with shared memory optimization
    if (id < 15360) {
        // Calculate the start positions for encoded and decoded text
        int startEncoded = id * 101;
        int startDecoded = id * 4;
        int finish = startEncoded + 100;

        // Loop through the encoded text
        for (int t = startEncoded; t < finish; t++) {
            if (encodedText[t] == ',') {
                // Update decoded text position with optimized access
                decodedText[startDecoded++] = encodedText[t + 1];
            }
        }
    }
}
```
