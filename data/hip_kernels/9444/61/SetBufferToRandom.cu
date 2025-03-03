#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void SetBufferToRandom(float* buffer, float min, float max, int size){
int offset = CUDASTDOFFSET;
hiprandState localState;
hiprand_init(7+offset, offset, 0, &localState);
__syncthreads();

float value = min + (max-min)*hiprand_uniform(&localState);
if(offset < size ) buffer[offset] = value;
}