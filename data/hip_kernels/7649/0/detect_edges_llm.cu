#include "hip/hip_runtime.h"
#include "includes.h"

#define width 100
#define height 72

unsigned char results[width * height];
unsigned char image[] = {/*...*/};

__global__ void detect_edges(unsigned char *input, unsigned char *output) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Improved indexing
    
    if (i >= width * height) return; // Ensure within bounds

    int y = i / width;
    int x = i % width; // Simplified calculation for x
    
    // Check borders
    if (x == 0 || y == 0 || x == width - 1 || y == height - 1) {
        output[i] = 0;
    } else {
        // Calculate adjacent indices
        int b = (y + 1) * width + x; // below
        int d = i - 1;               // left
        int f = i + 1;               // right
        int h = (y - 1) * width + x; // above

        int r = input[i] * 4 - input[b] - input[d] - input[f] - input[h];

        // Output result based on calculation
        output[i] = (r >= 0) ? 255 : 0;
    }
}