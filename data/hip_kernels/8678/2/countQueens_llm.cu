#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void countQueens(int* frontQueensPos, int* data, int* numFQP)
{
    int localResult = 0;
    int thisThread = blockIdx.z * (blockDim.x * blockDim.y * gridDim.x * gridDim.y) + 
                     blockIdx.y * (blockDim.x * blockDim.y * gridDim.x) + 
                     blockIdx.x * (blockDim.x * blockDim.y) + 
                     threadIdx.y * blockDim.x + threadIdx.x;

    // Boundary check for halting threads outside the work scope early
    if (blockIdx.x >= QUEENS || blockIdx.y >= QUEENS || threadIdx.x >= QUEENS || threadIdx.y >= QUEENS)
        return;

    // Allocate queen positions in shared memory to reduce frequent global memory access
    __shared__ int sharedQueenPos[QUEENS];
    sharedQueenPos[3] = blockIdx.x;
    sharedQueenPos[4] = blockIdx.y;
    sharedQueenPos[5] = threadIdx.x;
    sharedQueenPos[6] = threadIdx.y;

    // Unrolling the 'for' loop for reduced branch divergence
    if ((sharedQueenPos[4] - 4) == (sharedQueenPos[3] - 3) || (sharedQueenPos[4] + 4) == (sharedQueenPos[3] + 3) || sharedQueenPos[4] == sharedQueenPos[3]) return;
    if ((sharedQueenPos[5] - 5) == (sharedQueenPos[3] - 3) || (sharedQueenPos[5] + 5) == (sharedQueenPos[3] + 3) || sharedQueenPos[5] == sharedQueenPos[3] || (sharedQueenPos[5] - 5) == (sharedQueenPos[4] - 4) || (sharedQueenPos[5] + 5) == (sharedQueenPos[4] + 4) || sharedQueenPos[5] == sharedQueenPos[4]) return;
    if ((sharedQueenPos[6] - 6) == (sharedQueenPos[3] - 3) || (sharedQueenPos[6] + 6) == (sharedQueenPos[3] + 3) || sharedQueenPos[6] == sharedQueenPos[3] || (sharedQueenPos[6] - 6) == (sharedQueenPos[4] - 4) || (sharedQueenPos[6] + 6) == (sharedQueenPos[4] + 4) || sharedQueenPos[6] == sharedQueenPos[4] ||
        (sharedQueenPos[6] - 6) == (sharedQueenPos[5] - 5) || (sharedQueenPos[6] + 6) == (sharedQueenPos[5] + 5) || sharedQueenPos[6] == sharedQueenPos[5]) return;

    int totalFQP = numFQP[0] / 3;

    for (int FQP_number = 0; FQP_number < totalFQP; FQP_number++) {
        for (int i = 0; i < 3; i++)
            sharedQueenPos[i] = frontQueensPos[(FQP_number * 3) + i];

        bool legal = true;

        for (int i = 3; i <= 6; i++) {
            for (int j = 0; j < 3; j++) {
                if ((sharedQueenPos[i] - i) == (sharedQueenPos[j] - j) || (sharedQueenPos[i] + i) == (sharedQueenPos[j] + j) || sharedQueenPos[i] == sharedQueenPos[j]) {
                    legal = false;
                    break;
                }
            }
            if (!legal)
                break;
        }
        if (!legal)
            continue;

        int posNow = 7;
        sharedQueenPos[posNow] = -1;
        while (posNow > 6) {
            sharedQueenPos[posNow]++;
            while (sharedQueenPos[posNow] < QUEENS) {
                legal = true;
                for (int j = posNow - 1; j >= 0; j--) {
                    if ((sharedQueenPos[posNow] - posNow) == (sharedQueenPos[j] - j) || (sharedQueenPos[posNow] + posNow) == (sharedQueenPos[j] + j) || sharedQueenPos[posNow] == sharedQueenPos[j]) {
                        legal = false;
                        break;
                    }
                }
                if (!legal)
                    sharedQueenPos[posNow]++;
                else
                    break;
            }
            if (sharedQueenPos[posNow] < QUEENS) {
                if (posNow == (QUEENS - 1)) {
                    localResult++;
                    posNow--;
                }
                else {
                    posNow++;
                    sharedQueenPos[posNow] = -1;
                }
            }
            else
                posNow--;
        }
    }
    data[thisThread] = localResult;
}