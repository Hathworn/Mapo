#include "hip/hip_runtime.h"
#include "includes.h"
#pragma comment(lib,"cublas.lib")

using namespace std;

//==============================Function Prototypes================================
double getRand();

__global__ void deltaCalcOutput(float *OutActivation, float *Outputdelta, float *targets) {
    int n = blockIdx.x * blockDim.x + threadIdx.x;
    if (n < blockDim.x * gridDim.x) {  // Ensure thread index is within bounds
        float activation = OutActivation[n];
        float expVal = exp(-activation);  // Compute exp(-OutActivation[n]) once
        float sigmoid = 1 / (1 + expVal); // Compute sigmoid only once
        Outputdelta[n] = (targets[n] - activation) * sigmoid * (1 - sigmoid);
    }
}