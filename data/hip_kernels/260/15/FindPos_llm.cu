#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FindPos(int *pos, bool *forest, int text_size, int order, int step)
{
    // Use shared memory to reduce global memory access
    extern __shared__ bool shared_forest[];
    int text_idx = blockIdx.x * blockDim.x + threadIdx.x;
    int thread_local_idx = threadIdx.x + blockDim.x; // Local index for current block
    shared_forest[threadIdx.x] = forest[blockIdx.x * blockDim.x + threadIdx.x];
    __syncthreads();

    if (text_idx < text_size) {
        if (!shared_forest[threadIdx.x + blockDim.x]) {
            pos[text_idx] = 0;
        } else {
            bool isCurBlock = true;
            bool isLeftMost = (blockIdx.x < 1);
            int nodeIdx = thread_local_idx;
            int leftBound = blockDim.x;
            int rightBound = 2 * blockDim.x - 1;
            int alignOrder = 0;

            // bottom-up
            while (alignOrder != order) {
                int leftInx;
                if (nodeIdx - 1 < leftBound) {
                    if (isLeftMost) break;
                    isCurBlock = false;
                    leftInx = offset - step + rightBound;
                } else {
                    leftInx = nodeIdx - 1;
                }

                if (!forest[blockIdx.x * step + leftInx]) break;

                rightBound = leftBound - 1;
                leftBound /= 2;
                nodeIdx /= 2;
                alignOrder++;
            }

            // top-down
            if (alignOrder == order && !isLeftMost) isCurBlock = false;
            nodeIdx = (!isCurBlock) ? rightBound
                    : (nodeIdx - 1 < leftBound) ? nodeIdx
                    : nodeIdx - 1;

            while (alignOrder != 0) {
                if ((alignOrder == order && isCurBlock) || forest[blockIdx.x * step + 2 * nodeIdx + 1]) {
                    nodeIdx = 2 * nodeIdx;
                } else {
                    nodeIdx = 2 * nodeIdx + 1;
                }
                alignOrder--;
            }

            pos[text_idx] = (isCurBlock) ? (threadIdx.x - (nodeIdx - blockDim.x) + (forest[blockIdx.x * step + nodeIdx]))
                           : (step - nodeIdx + threadIdx.x);
        }
    }
}