#include "hip/hip_runtime.h"
#include "includes.h"
#pragma comment(lib,"cublas.lib")

using namespace std;

//==============================Function Prototypes================================
double getRand();

__global__ void printError(float *output, float *target) {
    // Calculate global thread index
    int n = blockIdx.x * blockDim.x + threadIdx.x;

    // Remove unnecessary computation for non-existent index
    if (n < blockDim.x * gridDim.x) {
        float error = target[n] - output[n];
        printf("%f \n", error);
    }
}