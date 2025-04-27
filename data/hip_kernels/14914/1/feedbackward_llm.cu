#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
__device__ __managed__ float weightedinputs[25]; // used as list of input neuron
__device__ __managed__ float weights[25]; // used as list of neuron connection weights
__device__ __managed__ int inputs[25]; // used as list of neuron connection weights
__device__ __managed__ float output = 0; // used to return output
__device__ __managed__ int expctd = 0; // used to return output

__global__ void feedbackward() { // trains the weights
    // Cache frequently accessed variables
    int idx = threadIdx.x; // Cache the thread index
    float lr = 0.3;
    float local_output = output; // Cache output value
    int local_expctd = expctd;   // Cache expected value
    float error = (local_expctd - local_output);

    // Update weights using cached indices
    weights[idx] += error * inputs[idx] * lr;
}