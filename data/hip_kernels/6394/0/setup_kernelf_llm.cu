#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

float *valuesf;
float *weightf;
float maxWf;

float *matchf;
const int fSUMFLAG=0;
const int fKNAPSACKFLAG = 1;

const int fAVGFLAG=2;
const int fMATCHFLAG=3;
const int fINVERSESUMFLAG=4;

const int fMAXIMIZE=-1;
const int fMINIMIZE=1;

__global__ void setup_kernelf(hiprandState *state, unsigned long seed)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x; // Compute unique thread ID
    hiprand_init(seed, id, 0, &state[id]); // Initialize hiprand state for each thread
}