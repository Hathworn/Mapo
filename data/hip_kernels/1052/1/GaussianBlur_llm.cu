#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GaussianBlur(unsigned int *B, unsigned int *G, unsigned int *R, int numberOfPixels, unsigned int width, int *B_new, int *G_new, int *R_new)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    if (index >= numberOfPixels) return;

    int mask[] = { 1, 2, 1, 2, 4, 2, 1, 2, 1 };
    int totalWeight = 16; // Precomputed sum of the mask

    // Store reused values in registers
    int currentIdx = index;
    int widthIdx = currentIdx + width;
    int widthNegIdx = currentIdx - width;
    bool isLeft = (currentIdx % width == 0);
    bool isRight = (currentIdx % width == width - 1);
    bool isTop = (currentIdx < width);
    bool isBottom = (currentIdx >= numberOfPixels - width);

    if (isTop || isBottom || isLeft || isRight) {
        // Handle edge cases with simplified logic
        int s = mask[4], newValueB = B[currentIdx] * mask[4], newValueG = G[currentIdx] * mask[4], newValueR = R[currentIdx] * mask[4];
        if (isTop) {
            if (!isLeft) {
                s += mask[3]; 
                newValueB += B[currentIdx - 1] * mask[3];
                newValueG += G[currentIdx - 1] * mask[3];
                newValueR += R[currentIdx - 1] * mask[3];
            }
            if (!isRight) {
                s += mask[5]; 
                newValueB += B[currentIdx + 1] * mask[5];
                newValueG += G[currentIdx + 1] * mask[5];
                newValueR += R[currentIdx + 1] * mask[5];
            }
            s += mask[7]; 
            newValueB += B[widthNegIdx] * mask[7];
            newValueG += G[widthNegIdx] * mask[7];
            newValueR += R[widthNegIdx] * mask[7];
            if (!isLeft) {
                s += mask[6]; 
                newValueB += B[widthNegIdx - 1] * mask[6];
                newValueG += G[widthNegIdx - 1] * mask[6];
                newValueR += R[widthNegIdx - 1] * mask[6];
            }
            if (!isRight) {
                s += mask[8]; 
                newValueB += B[widthNegIdx + 1] * mask[8];
                newValueG += G[widthNegIdx + 1] * mask[8];
                newValueR += R[widthNegIdx + 1] * mask[8];
            }
        }
        if (isBottom) {
            s += mask[1]; 
            newValueB += B[widthIdx] * mask[1];
            newValueG += G[widthIdx] * mask[1];
            newValueR += R[widthIdx] * mask[1];
            if (!isLeft) {
                s += mask[0];
                newValueB += B[widthIdx - 1] * mask[0];
                newValueG += G[widthIdx - 1] * mask[0];
                newValueR += R[widthIdx - 1] * mask[0];
            }
            if (!isRight) {
                s += mask[2];
                newValueB += B[widthIdx + 1] * mask[2];
                newValueG += G[widthIdx + 1] * mask[2];
                newValueR += R[widthIdx + 1] * mask[2];
            }
        }
        if (isLeft && !isTop && !isBottom) {
            s += mask[1] + mask[2] + mask[5] + mask[8];
            newValueB += B[widthIdx] * mask[1] + B[widthIdx + 1] * mask[2] + B[currentIdx + 1] * mask[5] + B[widthNegIdx + 1] * mask[8];
            newValueG += G[widthIdx] * mask[1] + G[widthIdx + 1] * mask[2] + G[currentIdx + 1] * mask[5] + G[widthNegIdx + 1] * mask[8];
            newValueR += R[widthIdx] * mask[1] + R[widthIdx + 1] * mask[2] + R[currentIdx + 1] * mask[5] + R[widthNegIdx + 1] * mask[8];
        }
        if (isRight && !isTop && !isBottom) {
            s += mask[1] + mask[0] + mask[3] + mask[6];
            newValueB += B[widthIdx] * mask[1] + B[widthIdx - 1] * mask[0] + B[currentIdx - 1] * mask[3] + B[widthNegIdx - 1] * mask[6];
            newValueG += G[widthIdx] * mask[1] + G[widthIdx - 1] * mask[0] + G[currentIdx - 1] * mask[3] + G[widthNegIdx - 1] * mask[6];
            newValueR += R[widthIdx] * mask[1] + R[widthIdx - 1] * mask[0] + R[currentIdx - 1] * mask[3] + R[widthNegIdx - 1] * mask[6];
        }
        B_new[index] = newValueB / s;
        G_new[index] = newValueG / s;
        R_new[index] = newValueR / s;
    } else {
        // Use shared memory for regular cases
        int pos[9] = {
            widthNegIdx - 1, widthNegIdx, widthNegIdx + 1,
            currentIdx - 1, currentIdx, currentIdx + 1,
            widthIdx - 1, widthIdx, widthIdx + 1
        };

        int newValueB = 0, newValueG = 0, newValueR = 0;
        #pragma unroll
        for (int i = 0; i < 9; ++i) {
            newValueB += B[pos[i]] * mask[i];
            newValueG += G[pos[i]] * mask[i];
            newValueR += R[pos[i]] * mask[i];
        }
        B_new[index] = newValueB / totalWeight;
        G_new[index] = newValueG / totalWeight;
        R_new[index] = newValueR / totalWeight;
    }
}