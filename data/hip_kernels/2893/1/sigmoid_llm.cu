#include "hip/hip_runtime.h"
#include "includes.h"

#define DEBUG false
#define DEBUG_OUTPUT false
#define DEBUG_DELTA_K false
#define DEBUGNET false
#define DEBUG_TIMEING true
#define index(i,j,ld) (((j)*(ld))+(i))

int numBlocks = 1;
int blockSize = 256;

using namespace std;

/*
*  Print Matrix on host
*/
__global__ void sigmoid(float* input, int num_elements) {
    // Calculate global thread ID
    const unsigned int tid = (blockIdx.x * blockDim.x) + threadIdx.x;

    // Ensure thread is within bounds
    if (tid < num_elements) {
        // Use math function optimization
        float value = __fdividef(1.0f, (1.0f + expf(-input[tid])));
        input[tid] = value;
    }
}