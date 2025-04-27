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
__global__ void addConstant(float* input, float constant, int num_elements) {
    // Calculate the global thread ID
    const unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if the thread ID is within range
    if (tid < num_elements) {
        // Add the constant to the input element
        input[tid] += constant;
    }
}