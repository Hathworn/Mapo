#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR CHECKING MACROS //////////////////////////////////////////////////////

__global__ void mteKernel(int noPaths, int nYears, int noPatches, float timeStep, float* rgr, float* brownians, float* jumpSizes, float* jumps, float* speciesParams, float *initPops, float* caps, float*mmm, int* rowIdx, int* elemsPerCol, float* pathPops, float* eps) {
    // Calculate global thread index
    int ii = blockIdx.x*blockDim.x + threadIdx.x;

    // Check bounds
    if (ii < noPaths) {
        // Initialize initial population vector
        for (int jj = 0; jj < noPatches; jj++) {
            pathPops[(ii*2)*noPatches+jj] = initPops[jj];
        }

        float grMean = speciesParams[0];

        for (int jj = 0; jj < nYears; jj++) {
            // Use shared memory for partial results
            extern __shared__ float sharedPathPops[];
            
            // Movement and mortality initialization
            for (int kk = 0; kk < noPatches; kk++) {
                sharedPathPops[kk] = 0.0;
            }

            __syncthreads(); // Ensure shared memory is initialized

            int iterator = 0;
            for (int kk = 0; kk < noPatches; kk++) {
                for (int ll = 0; ll < elemsPerCol[kk]; ll++) {
                    sharedPathPops[kk] += pathPops[(ii*2)*noPatches+rowIdx[iterator]] * mmm[iterator];
                    iterator++;
                }
            }

            __syncthreads(); // Wait for all threads to complete

            // Update pathPops from shared memory
            for (int kk = 0; kk < noPatches; kk++) {
                pathPops[(ii*2+1)*noPatches+kk] = sharedPathPops[kk];
            }

            // Natural birth and death calculations
            float jump = (jumps[ii*nYears + jj] < speciesParams[6]) ? 1.0f : 0.0f;
            float meanP = speciesParams[1];
            float reversion = speciesParams[4];

            float brownian = brownians[ii*nYears + jj] * speciesParams[2];
            float jumpSize = jumpSizes[ii*nYears + jj] * powf(speciesParams[5], 2) - powf(speciesParams[5], 2) / 2;

            grMean = grMean + reversion * (meanP - grMean) * timeStep + grMean * brownian + (expf(jumpSize) - 1) * grMean * jump;

            for (int kk = 0; kk < noPatches; kk++) {
                float gr = speciesParams[7] * rgr[ii*(nYears*noPatches) + jj*noPatches + kk] * grMean + grMean;
                pathPops[(ii*2)*noPatches+kk] = pathPops[(ii*2+1)*noPatches+kk] * (1.0f + gr * (caps[kk] - pathPops[(ii*2+1)*noPatches+kk]) / caps[kk]);
            }
        }

        // Calculate epsilon values
        eps[ii] = 0.0f;
        for (int jj = 0; jj < noPatches; jj++) {
            eps[ii] += pathPops[(ii*2+1)*noPatches+jj];
        }
    }
}