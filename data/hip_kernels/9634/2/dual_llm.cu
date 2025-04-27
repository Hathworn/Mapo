#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dual(float* xn, float* xcur, float* y1, float* y2, float* img, float tau, float lambda, int w, int h, int nc) {
    int x = threadIdx.x + blockDim.x * blockIdx.x;
    int y = threadIdx.y + blockDim.y * blockIdx.y;

    if (x < w && y < h) {
        int i = x + w * y;  // Calculate the base index once for all channels

        // Separate computations into variables outside the loop
        float invFactor = 1.f / (1.f + tau * lambda);
        float correctionTerm;
        float y1Left, y1Right, y2Top, y2Bottom;

        for (int z = 0; z < nc; z++) {
            int baseIndex = i + w * h * z;  // Calculate the index for each channel

            // Use ternary operators to simplify boundary condition checks
            y1Right = (x+1 < w) ? y1[baseIndex] : 0.f;
            y1Left = (x > 0) ? y1[baseIndex - 1] : 0.f;
            y2Bottom = (y+1 < h) ? y2[baseIndex] : 0.f;
            y2Top = (y > 0) ? y2[baseIndex - w] : 0.f;

            // Perform calculations
            correctionTerm = tau * ((y1Right - y1Left) + (y2Bottom - y2Top));
            xn[baseIndex] = (xcur[baseIndex] + correctionTerm + tau * lambda * img[baseIndex]) * invFactor;
        }
    }
}