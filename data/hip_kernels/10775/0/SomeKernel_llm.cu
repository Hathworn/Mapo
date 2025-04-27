#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

#define delta           10
#define rows            50
#define columns         50

__global__ void SomeKernel(int* res, int* data, int col, int row, int y, int step)
{
    unsigned int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by using shared memory for frequently accessed variables
    extern __shared__ int sharedData[];

    // Preload data into shared memory
    if (threadId < col) {
        for (int j = 0; j <= y; j++) {
            sharedData[threadId + j * row] = data[threadId + j * row];
        }
    }
    __syncthreads();

    int currDelta = 0;
    int index = step * threadId;

    // Process columns allocated to this thread
    if (index < col) {
        for (int i = index; i < (threadId + 1) * step && i < col; i++) {
            for (int j = y; j > 0; j--) {
                // Load data from shared memory
                currDelta = sharedData[i + j * row] - sharedData[i + (j - 1) * row];
                
                // Efficient absolute value calculation
                if (abs(currDelta) > delta) {
                    res[i] = j - 1;
                    break;
                }
            }
        }
    }
}