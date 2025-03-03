#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pi_estimation(float *pi, hiprandState *states)
{
unsigned int threadID = threadIdx.x + blockDim.x * blockIdx.x;
int count = 0;
float x,y,z;

hiprand_init(0, threadID, 1, &states[threadID]); //(seed, sequence number, offset, hiprandState)

for(int i = 0; i < trial_number; i++)
{
x = hiprand_uniform(&states[threadID]);//return sequence number of pseudorandom uniformly distributed.
y = hiprand_uniform(&states[threadID]);
z = (x*x + y*y);
if(z <= 1.0f) //if x,y in unit circle
{
count += 1;
}
}
pi[threadID] = 4.0f * count/(float)trial_number; //estimate PI value 4*count/number of trial
}