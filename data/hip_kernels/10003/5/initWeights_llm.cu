#include "hip/hip_runtime.h"
#include "includes.h"
#pragma comment(lib,"cublas.lib")

using namespace std;

//==============================Function Prototypes================================
double getRand();

__global__ void initWeights(float *dst, unsigned int seed) {
    // Calculate global thread index
    int n = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure n is within bounds before processing
    if (n < seed) {
        // Optimize division and loop conditions
        dst[n] /= (float)(seed);

        // Use a more efficient approach to handle scaling condition
        if (dst[n] > 5) {
            dst[n] /= 2;
        }

        // Optimize branch handling with bitwise operations
        if ((n & (seed % 3)) == 0) {
            dst[n] = -dst[n];
        }
    }
}