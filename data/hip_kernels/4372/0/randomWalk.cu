#include "hip/hip_runtime.h"
#include "includes.h"
// A program to generate a 1-dimensional NumPy array that stores the user’s desired number of Brownian Paths, all generated in parallel on crispr’s 3 GPU’s.


// array to store crossing time of each simulation, positive time for upper threshold and negative time for lower threshold. 0 if never crossed.
int *crossTimes = nullptr;

//Function to generate brownian paths, which are stored in results. Executes on the GPU, hence the __global__ identifier

// data structure to hold information for each GPU
struct DataStruct {
int deviceID; 		 // id of gpu
int sims;			 // number of simulations to be executed on this gpu
double *resultArray; // array to store brownian paths calculated on this gpu
int *crossArray;	 // array to store cross times calculates on this gpu
int N;				 // number of simulations on this gpu
double T;	       	 // parameter for brownian path equation
double drift;		 // drift parameter brownian path equation
double lowerThreshold;
double upperThreshold;
};

// function to execute on each individual GPU
__global__ void randomWalk(double *results, int *crossTimes, int T, int N, double drift, int numSims, double lowerThreshold, double upperThreshold, double deviceID) {

// a variable to keep track of this simulation's position in the crossTimes array
int crossTimeIndex = threadIdx.x + blockIdx.x * blockDim.x;

if (crossTimeIndex < numSims) {

// create random number generator
hiprandState_t state;
hiprand_init (blockIdx.x * (1000 * deviceID) + threadIdx.x + clock64(), 0, 0, &state);
double random;

// starting position of this siulation in results array
int start = (threadIdx.x + blockIdx.x * blockDim.x) * N;

// set default value of cross time for this simulation to 0, since the simulation hasn't crossed the threshold yet
crossTimes[crossTimeIndex] = 0;

// starting point of path is 0
results[start] = 0.0;

// boolean to keep track of whether this path has crossed
bool crossed = false;

for (int j = start + 1; j < start + N; j++) {
// generate random number
random = hiprand_normal_double(&state);

//calculate next step of path
results[j] = results[j-1] + drift * ((double) T / N) + random * sqrt((double) T / N);

// store crossing time as positive value if it has crossed the upper threshold. Negative value if crossed the lower threshold
if (!crossed && results[j] >= upperThreshold) {
crossTimes[crossTimeIndex] = j - start;
crossed = true;
}
else if (!crossed && results[j] <= lowerThreshold) {
crossTimes[crossTimeIndex] = -1 * (j - start);
crossed = true;
}
}

}

}