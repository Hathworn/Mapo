#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kLogregCost(float* probs, float* labels, float* maxProbs, float* labelLogProbs, float* correctProbs, const int numCases, const int numOut) {
  const int tx = blockIdx.x * blockDim.x + threadIdx.x;  // Use blockDim.x for better flexibility and grid size calculation

  if (tx < numCases) {
    const int label = static_cast<int>(labels[tx]);  // Use static_cast for type safety
    const float maxp = maxProbs[tx];
    const float labelp = __ldg(&probs[label * numCases + tx]);  // Use __ldg for faster memory access

    labelLogProbs[tx] = __logf(labelp);

    if (labelp != maxp) {
      correctProbs[tx] = 0.0f;
    } else {
      int numMax = 0;
      for (int i = 0; i < numOut; i++) {
        numMax += (__ldg(&probs[i * numCases + tx]) == maxp);  // Use __ldg inside the loop for memory access optimization
      }
      correctProbs[tx] = 1.0f / static_cast<float>(numMax);  // Static cast for consistent type
    }
  }
}