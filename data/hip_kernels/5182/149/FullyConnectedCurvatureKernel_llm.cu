#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FullyConnectedCurvatureKernel(float *weightsGradPtr, float *biasGradPtr, float *shiftedWeightsPtr, float *shiftedBiasPtr, float *avgWeightGradPtr, float *avgBiasGradPtr, float *weightGradCurvePtr, float *biasGradCurvePtr, float *dropoutMaskPtr, int prevLayerSize, int thisLayerSize) {
    // Use local variable to cache values for better performance
    int j = blockDim.x * blockIdx.y * gridDim.x + blockDim.x * blockIdx.x + threadIdx.x;
    
    if (j < thisLayerSize && !dropoutMaskPtr[j]) {
        int index = j;
        float abs_val, avgGrad;
        
        for (int i = 0; i < prevLayerSize; i++) {
            // Precompute avgWeightGradPtr for reduced memory access
            avgGrad = avgWeightGradPtr[index];
            avgGrad = (avgGrad == 0) ? 0.000001 : avgGrad; // Avoid division by zero
            abs_val = abs(weightsGradPtr[index] - shiftedWeightsPtr[index]);
            weightGradCurvePtr[index] = abs_val / avgGrad;
            index += thisLayerSize;
        }

        // Compute bias curvature
        avgGrad = avgBiasGradPtr[j];
        avgGrad = (avgGrad == 0) ? 0.000001 : avgGrad; // Avoid division by zero
        abs_val = abs(biasGradPtr[j] - shiftedBiasPtr[j]);
        biasGradCurvePtr[j] = abs_val / avgGrad;
    }
}