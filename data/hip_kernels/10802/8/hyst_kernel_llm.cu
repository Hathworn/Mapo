#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hyst_kernel(unsigned char *data, unsigned char *out, int rows, int cols) {
    // Establish our high and low thresholds as floats
    const float lowThresh  = 10.0f;
    const float highThresh = 70.0f;

    // These variables are offset by one to avoid seg. fault errors
    // As such, this kernel ignores the outside ring of pixels
    const int row = blockIdx.y * blockDim.y + threadIdx.y + 1;
    const int col = blockIdx.x * blockDim.x + threadIdx.x + 1;
    const int pos = row * cols + col;

    // Boundary check to avoid processing the outside ring
    if(row < rows-1 && col < cols-1) {
        const unsigned char EDGE = 255;
        const unsigned char magnitude = data[pos];

        // Process each pixel according to the threshold rules
        if(magnitude >= highThresh) {
            out[pos] = EDGE;
        } else if(magnitude <= lowThresh) {
            out[pos] = 0;
        } else {
            const float med = (highThresh + lowThresh) / 2;
            out[pos] = (magnitude >= med) ? EDGE : 0;
        }
    }
}