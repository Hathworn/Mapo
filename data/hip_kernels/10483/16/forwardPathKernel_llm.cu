#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR CHECKING MACROS //////////////////////////////////////////////////////

__global__ void forwardPathKernel(int noPaths, int nYears, int noSpecies, int noPatches, int noControls, int noUncertainties, float timeStep, float* initPops, float* pops, float* mmm, int* rowIdx, int* elemsPerCol, int maxElems, float* speciesParams, float* caps, float* aars, float* uncertParams, int* controls, float* uJumps, float* uBrownian, float* uJumpSizes, float* uJumpsSpecies, float* uBrownianSpecies, float* uJumpSizesSpecies, float* rgr, float* uResults, float* totalPops) {

    // Global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check thread boundary
    if (idx >= noPaths) return;

    // Use shared memory for species parameters
    extern __shared__ float sharedMem[];
    float* grMean = sharedMem;

    // Initialise the population data at time t=0
    for (int ii = 0; ii < noSpecies; ii++) {
        float population = 0;
        for (int jj = 0; jj < noPatches; jj++) {
            pops[idx*(nYears+1)*noSpecies*noPatches + ii*noPatches + jj] = initPops[jj];
            population += pops[idx*(nYears+1)*noSpecies*noPatches + ii*noPatches + jj];
        }
        totalPops[idx*(nYears+1)*noSpecies + ii] = population;
    }

    // Carry over the initial value for all uncertainties
    for (int ii = 0; ii < noUncertainties; ii++) {
        uResults[idx*noUncertainties*(nYears+1) + ii] = uncertParams[ii*6];
    }

    // Initialize grMean using shared memory
    for (int ii = 0; ii < noSpecies; ii++) {
        grMean[ii] = speciesParams[ii*8];
    }

    // All future time periods
    for (int ii = 0; ii < nYears; ii++) {
        // Control to pick
        int control = controls[idx*nYears + ii];

        for (int jj = 0; jj < noSpecies; jj++) {
            totalPops[idx*(nYears+1)*noSpecies + (ii+1)*noSpecies + jj] = 0;

            // Adjust the global growth rate mean
            float jump = (uJumpsSpecies[idx*noSpecies*nYears + ii*noSpecies + jj] < speciesParams[jj*8 + 5]) ? 1.0f : 0.0f;
            float meanP = speciesParams[jj*8 + 1];
            float reversion = speciesParams[jj*8 + 4];
            float brownian = uBrownianSpecies[idx*noSpecies*nYears + ii*noSpecies + jj] * speciesParams[jj*8 + 2];
            float jumpSize = uJumpSizesSpecies[idx*noSpecies*nYears + ii*noSpecies + jj] * powf(speciesParams[jj*8 + 5], 2) - powf(speciesParams[jj*8 + 5], 2) / 2;

            grMean[jj] = grMean[jj] + reversion * (meanP - grMean[jj]) * timeStep + grMean[jj] * brownian + (expf(jumpSize) - 1) * grMean[jj] * jump;

            float initialPopulation = 0.0f;
            for (int kk = 0; kk < noPatches; kk++) {
                initialPopulation += pops[idx*(nYears+1)*noSpecies*noPatches + ii*noSpecies*noPatches + jj*noPatches + kk];
            }

            for (int kk = 0; kk < noControls; kk++) {
                float totalPop = 0.0f;
                int iterator = 0;

                for (int ll = 0; ll < noPatches; ll++) {
                    float population = 0.0f;
                    for (int mm = 0; mm < elemsPerCol[(jj*noControls + kk)*noPatches + ll]; mm++) {
                        float value = pops[idx*(nYears+1)*noSpecies*noPatches + ii*noSpecies*noPatches + jj*noPatches + rowIdx[iterator + (jj*noControls + kk)*maxElems]] * mmm[iterator + (jj*noControls + kk)*maxElems];
                        population += value;
                        iterator++;
                    }
                    totalPop += population;

                    if (kk == control && ii < nYears) {
                        rgr[idx*noSpecies*noPatches*nYears + ii*noSpecies*noPatches + jj*noPatches + ll] = grMean[jj] + rgr[idx*noSpecies*noPatches*nYears + ii*noSpecies*noPatches + jj*noPatches + ll] * speciesParams[jj*8 + 7];
                        float gr = rgr[idx*noSpecies*noPatches*nYears + ii*noSpecies*noPatches + jj*noPatches + ll];

                        pops[idx*(nYears+1)*noSpecies*noPatches + (ii+1)*noSpecies*noPatches + jj*noPatches + ll] = population * (1.0f + gr*(caps[jj*noPatches + ll] - population) / caps[jj*noPatches + ll] / 100.0);
                        totalPops[idx*noSpecies*(nYears+1) + (ii+1)*noSpecies + jj] += pops[idx*(nYears+1)*noSpecies*noPatches + (ii+1)*noSpecies*noPatches + jj*noPatches + ll];
                    }
                }
                aars[idx*(nYears+1)*noControls*noSpecies + ii*noControls*noSpecies + jj*noControls + kk] = totalPop / initialPopulation;
            }
        }

        for (int jj = 0; jj < noUncertainties; jj++) {
            float jump = (uJumps[idx*noUncertainties*nYears + ii*noUncertainties + jj] < uncertParams[jj*6 + 5]) ? 1.0f : 0.0f;
            float curr = uResults[idx*noUncertainties*(nYears+1) + ii*noUncertainties + jj];
            float meanP = uncertParams[jj*6 + 1];
            float reversion = uncertParams[jj*6 + 3];
            float brownian = uBrownian[idx*noUncertainties*nYears + ii*noUncertainties + jj] * uncertParams[jj*6 + 2];
            float jumpSize = uJumpSizes[idx*noUncertainties*nYears + ii*noUncertainties + jj] * powf(uncertParams[jj*6 + 4], 2) - powf(uncertParams[jj*6 + 4], 2) / 2;

            uResults[idx*noUncertainties*(nYears+1) + (ii+1)*noUncertainties + jj] = curr + reversion * (meanP - curr) * timeStep + curr * brownian + (expf(jumpSize) - 1) * curr * jump;
        }
    }
}