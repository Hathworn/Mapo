#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR CHECKING MACROS //////////////////////////////////////////////////////

__global__ void expPVPath(const int noPaths, const float gr, const int nYears, const float meanP, const float timeStep, const float rrr, float current, float reversion, float jumpProb, const float* brownian, const float* jumpSize, const float* jump, float* result) {

    // Get the global index for the matrix
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < noPaths) {
        // Use cache to store repeated computation
        float pow_gr_rrr[nYears];  // Precompute pow values for optimization
        for (int ii = 0; ii < nYears; ii++) {
            pow_gr_rrr[ii] = pow(1 + gr, ii) / pow((1 + rrr), ii);
        }

        // Simulate a forward path
        float value = 0;
        float curr = current;

        for (int ii = 0; ii < nYears; ii++) {
            // Use ternary operation to simplify jumped evaluation
            float jumped = (jump[idx + ii] < jumpProb) ? 1.0f : 0.0f;

            // Simplified calculation into single expression
            curr += reversion * (meanP - curr) * timeStep + curr * brownian[idx + ii] +
                    (exp(jumpSize[idx + ii]) - 1) * curr * jumped;
            value += pow_gr_rrr[ii] * curr;
        }

        result[idx] = value;
    }
}