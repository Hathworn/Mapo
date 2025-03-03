#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void randomWalk(double *results, int *crossTimes, int T, int N, int numSims) {
int crossTimeIndex = threadIdx.x + blockIdx.x * blockDim.x;
if (crossTimeIndex < numSims) {
hiprandState_t state;
hiprand_init (1234, 0, 0, &state);
double random;
int start = (threadIdx.x + blockIdx.x * blockDim.x) * N;

crossTimes[crossTimeIndex] = 0;
results[start] = 0.0;

for (int j = start + 1; j < start + N; j++) {
random = hiprand_normal_double(&state);
results[j] = results[j-1] + random * sqrt((double) T / N);
}
}

/*
Generate 2 doubles at once. Test later to see if this is more efficient:
double hiprand_normal2_double (state);
*/

}