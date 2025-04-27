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
__global__ void squaredError(float* predicted_values, float* actual_values, float* results, int num_elements){
    // Calculate the global thread index
    const unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if within array bounds
    if (tid < num_elements) {
        // Calculate squared error
        float diff = actual_values[tid] - predicted_values[tid];
        results[tid] = diff * diff;
    }
}