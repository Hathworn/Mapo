#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;

const int sizePoint = 500;
const int sizeIndividum = 1000;
const int mathValueMutation = 5;
const float dispersionMutation = 5.0f;
const int powCount = 3;
const float randMaxCount = 20.0f;
const int maxPokoleney = 30;

__global__ void errorsKernel(float *points, float *individs, float *errors, int powCount, int sizePoint)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Compute global thread index
    if (id >= sizeIndividum) return; // Ensure within bounds

    float error = 0.0f; // Initialize error for this individual
    for (int i = 0; i < sizePoint; i++) {
        float ans = 0.0f; 
        float x = 1.0f;
        for (int j = 0; j < powCount; j++) {
            if (j > 0) { // Use efficient power calculation
                x *= (float)i;
            }
            ans += x * individs[id * powCount + j];
        }
        float diff = points[i] - ans;
        error += diff * diff;
    }
    errors[id] = sqrt(error); // Calculate the final error
}
```
