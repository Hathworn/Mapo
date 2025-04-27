#include "hip/hip_runtime.h"
#include "includes.h"

// Array to store crossing time of each simulation, positive time for upper threshold and negative time for lower threshold. 0 if never crossed.
int *crossTimes = nullptr;

// Data structure to hold information for each GPU
struct DataStruct {
    int deviceID;          // id of gpu
    int sims;              // number of simulations to be executed on this gpu
    double *resultArray;   // array to store brownian paths calculated on this gpu
    int *crossArray;       // array to store cross times calculates on this gpu
    int N;                 // number of simulations on this gpu
    double T;              // parameter for brownian path equation
    double drift;          // drift parameter brownian path equation
    double lowerThreshold;
    double upperThreshold;
};

// Optimized function to execute on each individual GPU
__global__ void randomWalk(double *results, int *crossTimes, int T, int N, double drift, int numSims, double lowerThreshold, double upperThreshold, double deviceID) {
    
    // Unique simulation index
    int simIndex = threadIdx.x + blockIdx.x * blockDim.x;

    // Check boundary condition early to avoid unnecessary computations
    if (simIndex >= numSims) return;

    // Initialize random number generator
    hiprandState_t state;
    hiprand_init(blockIdx.x * (1000 * deviceID) + threadIdx.x + clock64(), 0, 0, &state);

    // Starting position of this simulation in results array
    int start = simIndex * N;
    
    // Set default value of cross time for this simulation to 0
    crossTimes[simIndex] = 0;
    results[start] = 0.0;

    bool crossed = false;
    double sqrtT_N = sqrt((double) T / N); // Precompute sqrt to improve performance
    double drift_T_N = drift * ((double) T / N); // Precompute drift factor

    for (int j = 1; j < N; j++) { // Directly iterate over the steps

        // Generate next step of path
        double random = hiprand_normal_double(&state);
        results[start + j] = results[start + j - 1] + drift_T_N + random * sqrtT_N;

        // Store crossing time
        if (!crossed) {
            if (results[start + j] >= upperThreshold) {
                crossTimes[simIndex] = j;
                crossed = true;
            } else if (results[start + j] <= lowerThreshold) {
                crossTimes[simIndex] = -j;
                crossed = true;
            }
        }
    }
}