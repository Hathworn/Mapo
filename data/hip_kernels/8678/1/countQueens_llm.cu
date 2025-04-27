#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void countQueens(int* frontQueensPos, int* data, int* numFQP)
{
    int localResult = 0;
    int thisThread = ((blockIdx.x * gridDim.x + blockIdx.y) * gridDim.y + threadIdx.x) * blockDim.x + threadIdx.y;

    if (blockIdx.x >= QUEENS || blockIdx.y >= QUEENS || threadIdx.x >= QUEENS || threadIdx.y >= QUEENS)
        return;

    int queenPos[QUEENS];  // Use stack allocation instead of new

    queenPos[3] = blockIdx.x;
    queenPos[4] = blockIdx.y;
    queenPos[5] = threadIdx.x;
    queenPos[6] = threadIdx.y;

    // Initial conflict checks
    for (int i = 4; i <= 6; i++) {
        for (int j = 3; j < i; j++) {
            if ((queenPos[i] - i) == (queenPos[j] - j) || (queenPos[i] + i) == (queenPos[j] + j) || queenPos[i] == queenPos[j]) {
                return;
            }
        }
    }

    int totalFQP = numFQP[0] / 3;

    for (int FQP_number = 0; FQP_number < totalFQP; FQP_number++) {
        for (int i = 0; i < 3; i++)
            queenPos[i] = frontQueensPos[(FQP_number * 3) + i];

        bool legal = true;
        
        // Additional conflict checks
        for (int i = 3; i <= 6; i++) {
            for (int j = 0; j < 3; j++) {
                if ((queenPos[i] - i) == (queenPos[j] - j) || (queenPos[i] + i) == (queenPos[j] + j) || queenPos[i] == queenPos[j]) {
                    legal = false;
                    break;
                }
            }
            if (!legal) break;
        }
        if (!legal) continue;

        int posNow = 7;
        queenPos[posNow] = -1;
        while (posNow > 6) {
            queenPos[posNow]++;
            while (queenPos[posNow] < QUEENS) {
                legal = true;
                for (int j = posNow - 1; j >= 0; j--) {
                    if ((queenPos[posNow] - posNow) == (queenPos[j] - j) || 
                        (queenPos[posNow] + posNow) == (queenPos[j] + j) || 
                        queenPos[posNow] == queenPos[j]) {
                        legal = false;
                        break;
                    }
                }
                if (!legal)
                    queenPos[posNow]++;
                else
                    break;
            }
            if (queenPos[posNow] < QUEENS) {
                if (posNow == (QUEENS - 1)) {
                    localResult++;
                    posNow--;
                } else {
                    posNow++;
                    queenPos[posNow] = -1;
                }
            } else {
                posNow--;
            }
        }
    }
    data[thisThread] = localResult;
}