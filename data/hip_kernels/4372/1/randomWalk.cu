#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void randomWalk(double *results, int *crossTimes, int T, int N, double drift, int numSims, double lowerThreshold, double upperThreshold, int deviceID) {

int crossTimeIndex = threadIdx.x + blockIdx.x * blockDim.x;

if (crossTimeIndex < numSims) {

hiprandState_t state;
hiprand_init (blockIdx.x * (1000 * deviceID) + threadIdx.x + clock64(), 0, 0, &state);
double random;
int start = (threadIdx.x + blockIdx.x * blockDim.x) * N;

crossTimes[crossTimeIndex] = 0;
results[start] = 0.0;
bool crossed = false;

for (int j = start + 1; j < start + N; j++) {
random = hiprand_normal_double(&state);
// results[j] = results[j-1] + random * sqrt((double) T / N);
results[j] = results[j-1] + drift * ((double) T / N) + random * sqrt((double) T / N);
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


/*
Generate 2 doubles at once. Test later to see if this is more efficient:
double hiprand_normal2_double (state);
*/

}