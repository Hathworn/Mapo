#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void updateHiddenWeights(float* d_weights, float error, float lr, int keyPress, float* d_outputweights, int screenSize, int numHiddenNeurons, float* d_bias, float* firstFire){
    int id = threadIdx.x + blockDim.x * blockIdx.x;

    if (id >= numHiddenNeurons) return;  // Exit if thread index is out of bounds

    float totalChange = 0.0f;
    for (int i = 0; i < screenSize; ++i) {
        // Cache repeated calculations
        float outputWeight = d_outputweights[id * numHiddenNeurons + keyPress];
        float fireEffect = firstFire[id] * 2 - 1;
        float change = error * lr * outputWeight * fireEffect;
        totalChange += change;

        // Combined min and max operations
        float newWeight = d_weights[id * screenSize + i] + change;
        d_weights[id * screenSize + i] = fminf(1.0f, fmaxf(0.0f, newWeight));
    }
    float biasChange = totalChange * -0.5f;
    d_bias[id] += biasChange;
}