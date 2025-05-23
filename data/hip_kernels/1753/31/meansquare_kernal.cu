#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void meansquare_kernal(const float * data, float * device_stats, const int size, const int num_calcs, const int num_threads, const int offset)
{
float meansq = 0.0f;

const uint x=threadIdx.x;
const uint y=blockIdx.x;
int idx = x + y*num_threads + offset;

for(int i = 0; i < size; i++){
int index = i*size + idx % size + ((idx/size)*size*size); //for coalesing
meansq += data[index]*data[index];
}

device_stats[idx] = meansq/size;
}