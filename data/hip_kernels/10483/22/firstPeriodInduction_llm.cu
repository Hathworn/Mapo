```c
#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR CHECKING MACROS //////////////////////////////////////////////////////

__global__ void firstPeriodInduction(int noPaths, int nYears, int noSpecies, int noControls, float timeStep, float unitCost, float unitRevenue, float rrr, int noFuels, int noCommodities, float* Q, float* fuelCosts, float* totalPops, float* speciesParams, int* controls, float* aars, float* uComposition, float* uResults, int* fuelIdx, float* condExp, int* optCont, float* stats) {

    extern __shared__ float sharedMem[]; // Use shared memory for temporary storage
    float* payoffs = sharedMem;
    float* dataPoints = payoffs + noControls;
    bool* valid = (bool*)(dataPoints + noControls);

    int tid = threadIdx.x;
    if (tid < noControls) {
        payoffs[tid] = 0.0f;
        dataPoints[tid] = 0.0f;
        valid[tid] = true;
    }
    __syncthreads();

    float unitFuel = 0.0f, orePrice = 0.0f;
    if (tid < noFuels) {
        atomicAdd(&unitFuel, fuelCosts[tid] * uResults[fuelIdx[tid]]);
    }
    if (tid < noCommodities) {
        atomicAdd(&orePrice, uComposition[tid] * uResults[noFuels + tid]);
    }
    __syncthreads(); // Synchronize after using shared variables

    for (int ii = tid; ii < noPaths; ii += blockDim.x) {
        int control = controls[ii * nYears];
        atomicAdd(&payoffs[control], condExp[ii + noPaths]);
        atomicAdd(&dataPoints[control], 1.0f);
    }
    __syncthreads(); // Ensure all threads have added their payoffs

    float adjPop;
    for (int ii = tid; ii < noControls; ii += blockDim.x) {
        if (dataPoints[ii] > 0) {
            payoffs[ii] /= (dataPoints[ii] * (1 + rrr * timeStep / 100));
        } else {
            valid[ii] = false;
            continue;
        }

        for (int jj = 0; jj < noSpecies; jj++) {
            adjPop = totalPops[jj] * aars[jj * noControls + ii];
            if (adjPop < speciesParams[noSpecies * jj + 3] && ii > 0) {
                valid[ii] = false;
                break;
            }
        }
        if (valid[ii]) {
            payoffs[ii] += Q[ii] * (unitCost + unitFuel - unitRevenue * orePrice);
            if (payoffs[ii] > 0) payoffs[ii] = 0.0f;
        } else {
            payoffs[ii] = NAN;
        }
    }
    __syncthreads(); // Ensure all calculations are finished before finding the best control

    if (tid == 0) {
        float bestExp = payoffs[0];
        int bestCont = 0;
        for (int ii = 1; ii < noControls; ii++) {
            if (isfinite(payoffs[ii]) && payoffs[ii] < bestExp) {
                bestExp = payoffs[ii];
                bestCont = ii;
            }
        }

        stats[2] = 0;
        for (int ii = 0; ii < noPaths; ii++) {
            condExp[ii] = bestExp;
            optCont[ii] = bestCont;
            if (controls[ii * nYears] == bestCont) {
                stats[2] += (condExp[ii + noPaths] - payoffs[bestCont]) * (condExp[ii + noPaths] - payoffs[bestCont]);
            }
        }

        stats[0] = condExp[0];
        stats[1] = (float)optCont[0];
        stats[2] = sqrt(stats[2] / (dataPoints[bestCont] * (1 + rrr / (100 * timeStep))));
    }
}