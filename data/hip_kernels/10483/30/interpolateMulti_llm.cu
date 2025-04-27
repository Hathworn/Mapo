#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR CHECKING MACROS //////////////////////////////////////////////////////

__global__ void interpolateMulti(int points, int noDims, int dimRes, float* surrogate, float* predictors, float* results) {
    // Global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < points) {
        // Utilize shared memory for frequently accessed data
        extern __shared__ float sharedMemory[];
        float* lower = sharedMemory;
        float* upper = &lower[noDims];
        float* coeffs = &upper[noDims];

        int lowerInd[MAX_DIMS];  // Assuming MAX_DIMS is defined appropriately

        for (int jj = 0; jj < noDims; jj++) {
            float lowerValue = surrogate[jj * dimRes];
            float upperValue = surrogate[(jj + 1) * dimRes - 1];
            lower[jj] = lowerValue;
            upper[jj] = upperValue;

            float predictorValue = predictors[noDims * idx + jj];
            lowerInd[jj] = (int)((dimRes - 1) * (predictorValue - lowerValue) / (upperValue - lowerValue));

            if (lowerInd[jj] >= (dimRes - 1)) {
                lowerInd[jj] = dimRes - 2;
            } else if (lowerInd[jj] < 0) {
                lowerInd[jj] = 0;
            }
        }

        // Uppermost dimensions x value
        float x0 = surrogate[lowerInd[0]];
        float x1 = surrogate[lowerInd[0] + 1];
        float xd = (predictors[noDims * idx] - x0) / (x1 - x0);

        int idxL = 0;

        // Optimize power calculations by avoiding redundant calls
        int dimFactor = (int)pow(2, noDims - 1);

        for (int jj = 0; jj < dimFactor; jj++) {
            idxL = dimRes * noDims;  // Reset for each iteration

            for (int kk = 1; kk < noDims; kk++) {
                int rem = ((jj >> (noDims - kk - 1)) + 1) & 1;
                idxL += (lowerInd[kk] + rem) * (int)pow(dimRes, noDims - kk - 1);
            }

            int idxU = idxL + (lowerInd[0] + 1) * (int)pow(dimRes, noDims - 1);
            idxL += lowerInd[0] * (int)pow(dimRes, noDims - 1);

            coeffs[jj] = surrogate[idxL] * (1 - xd) + surrogate[idxU] * xd;
        }

        // Compute interpolated value
        for (int jj = 1; jj < noDims; jj++) {
            x0 = surrogate[jj * dimRes + lowerInd[jj]];
            x1 = surrogate[jj * dimRes + lowerInd[jj] + 1];
            xd = (predictors[noDims * idx + jj] - x0) / (x1 - x0);

            int jump = (int)pow(2, noDims - jj - 2);
            for (int kk = 0; kk < (int)pow(2, jj); kk++) {
                coeffs[kk] = coeffs[kk] * (1 - xd) + coeffs[kk + jump] * xd;
            }
        }

        // Store the result
        results[idx] = coeffs[0];
    }
}
```
