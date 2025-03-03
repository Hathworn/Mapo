#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void randomWalk(double *results, int *crossTimes, double T, int N, int numSims, double lowerThreshold, double upperThreshold, int *dev_failCross, double seconds) {
int crossTimeIndex = threadIdx.x + blockIdx.x * blockDim.x;

if (crossTimeIndex < numSims) {
hiprandState_t state;

hiprand_init (blockIdx.x * 1000 + threadIdx.x + seconds, 0, 0, &state);
double random;
int start = (threadIdx.x + blockIdx.x * blockDim.x) * N;

bool crossed = false;

crossTimes[crossTimeIndex] = 0;
results[start] = 0.0;

for (int j = start + 1; j < start + N; j++) {
random = hiprand_normal_double(&state);
results[j] = results[j-1] + random * sqrt((double) T / N);
if (results[j] >= upperThreshold && !crossed) {
crossTimes[crossTimeIndex] = j - start;
crossed = true;
}
else if (results[j] <= lowerThreshold && !crossed) {
crossTimes[crossTimeIndex] = -1 * (j - start);
crossed = true;
}
}

if (!crossed) {
atomicAdd(dev_failCross, 1);
}


}


/*
Generate 2 doubles at once. Test later to see if this is more efficient:
double hiprand_normal2_double (state);
*/

}