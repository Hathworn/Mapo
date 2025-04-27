#include "hip/hip_runtime.h"
#include "includes.h"
#define NO_HIDDEN_NEURONS 5

extern "C"
__global__ void deltasBatch(float *inputs, float *outputs, float *weights, float *weightsDeltas, int noInputs, int inputSize) {
    int gid = blockIdx.x * blockDim.x + threadIdx.x;
    float sum = 0;
    int offsetDeltas = ((inputSize + 1) * NO_HIDDEN_NEURONS + NO_HIDDEN_NEURONS + 1) * gid;
    int offsetInput = noInputs * inputSize * gid;
    int offsetOutputs = noInputs * gid;
    float activationHidden[NO_HIDDEN_NEURONS];
    float error;

    // Efficiently zero out weightsDeltas
    for (int j = 0; j < (inputSize + 1) * (NO_HIDDEN_NEURONS + 1); j++) {
        weightsDeltas[offsetDeltas + j] = 0;
    }

    for (int i = 0; i < noInputs; i++) {
        // Vectorized computation for hidden layer activations
        for (int hidden = 0; hidden < NO_HIDDEN_NEURONS; hidden++) {
            sum = weights[(inputSize + 1) * hidden + inputSize]; // Bias term
            for (int imageIndex = 0; imageIndex < inputSize; imageIndex++) {
                sum += inputs[offsetInput + i * inputSize + imageIndex] * weights[(inputSize + 1) * hidden + imageIndex];
            }
            activationHidden[hidden] = (sum > 0) ? 1 : 0;
        }

        // Compute output layer sum
        sum = weights[(inputSize + 1) * NO_HIDDEN_NEURONS + NO_HIDDEN_NEURONS]; // Bias term
        for (int hidden = 0; hidden < NO_HIDDEN_NEURONS; hidden++) {
            sum += activationHidden[hidden] * weights[(inputSize + 1) * NO_HIDDEN_NEURONS + hidden];
        }
        sum = (sum > 0) ? 1 : 0;
        sum = outputs[offsetOutputs + i] - sum;

        if (sum != 0) {
            // Update weightsDeltas for output layer
            for (int hidden = 0; hidden < NO_HIDDEN_NEURONS; hidden++) {
                weightsDeltas[offsetDeltas + (inputSize + 1) * NO_HIDDEN_NEURONS + hidden] += sum * activationHidden[hidden];
            }
            weightsDeltas[offsetDeltas + (inputSize + 1) * NO_HIDDEN_NEURONS + NO_HIDDEN_NEURONS] += sum;

            // Propagate error back to hidden layer
            for (int hidden = 0; hidden < NO_HIDDEN_NEURONS; hidden++) {
                error = (sum * weights[(inputSize + 1) * NO_HIDDEN_NEURONS + hidden] > 0) ? 1 : 0;
                error -= activationHidden[hidden];
                
                if (error != 0) {
                    // Efficiently update weightsDeltas for hidden layer
                    for (int imageIndex = 0; imageIndex < inputSize; imageIndex++) {
                        weightsDeltas[offsetDeltas + (inputSize + 1) * hidden + imageIndex] += error * inputs[offsetInput + i * inputSize + imageIndex];
                    }
                    weightsDeltas[offsetDeltas + (inputSize + 1) * hidden + inputSize] += error;
                }
            }
        }
    }
}