#include "hip/hip_runtime.h"
#include "includes.h"
#pragma comment(lib,"cublas.lib")

using namespace std;

//==============================Function Prototypes================================
double getRand();

__global__ void deltaCalcHidden(float *Activation, float *delta) {
    int n = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if 'n' is within valid range
    if (n < gridDim.x * blockDim.x) {
        // Store the commonly used values in local variables
        float act_val = Activation[n];
        float exp_value = exp(-act_val);
        float sigmoid = 1 / (1 + exp_value);

        // Update delta using the stored values
        delta[n] *= sigmoid * (1 - sigmoid);
    }
}