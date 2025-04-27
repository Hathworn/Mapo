#include "hip/hip_runtime.h"
#include "includes.h"
#pragma comment(lib,"cublas.lib")

using namespace std;

//==============================Function Prototypes================================
double getRand();

__global__ void weightUpdate(float *d_W, float *d_D, float *d_N) {
    int j = blockIdx.x * blockDim.x + threadIdx.x; // Row index
    int k = blockIdx.y * blockDim.y + threadIdx.y; // Column index
    int n = j * gridDim.y * blockDim.y + k;         // Linear index calculation

    // Check index bounds to prevent access violations
    if (n < gridDim.x * gridDim.y * blockDim.x * blockDim.y) {
        float N = 0.1; // Learning rate constant
        d_W[n] = d_W[n] + N * d_D[k] * d_N[j];
    }
}