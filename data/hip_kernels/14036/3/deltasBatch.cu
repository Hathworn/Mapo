#include "hip/hip_runtime.h"
#include "includes.h"
#define NO_HIDDEN_NEURONS 5
extern "C"
__global__ void deltasBatch(float *inputs, float *outputs, float *weights, float *weightsDeltas, int noInputs, int inputSize, int offsetHidden){
int gid = blockIdx.x * blockDim.x + threadIdx.x;
float sum=0;
int offsetDeltas = ((inputSize+1)*NO_HIDDEN_NEURONS+NO_HIDDEN_NEURONS+1)*gid;
int offsetInput = noInputs*inputSize*gid;
int offsetOutputs = noInputs*gid;
float activationHidden[NO_HIDDEN_NEURONS];
float error;
int currentHidden = offsetHidden%NO_HIDDEN_NEURONS;

for(int imageIndex=0;imageIndex<=inputSize;imageIndex++){
weightsDeltas[offsetDeltas+(inputSize+1)*currentHidden+imageIndex]=0;
}
weightsDeltas[offsetDeltas+(inputSize+1)*NO_HIDDEN_NEURONS+currentHidden]=0;

for (int i=0;i<noInputs;i++){
for(int hidden=0;hidden<NO_HIDDEN_NEURONS;hidden++){
sum=0;
for(int imageIndex=0;imageIndex<inputSize;imageIndex++){
sum+=inputs[offsetInput+i*inputSize+imageIndex]*weights[(inputSize+1)*hidden+imageIndex];
}
sum+=weights[(inputSize+1)*hidden+inputSize];
if(sum>0) activationHidden[hidden]=1;
else  activationHidden[hidden]=0;
//activationHidden[hidden]=sum/(1+abs(sum));
}
sum=0;
for(int hidden=0;hidden<NO_HIDDEN_NEURONS;hidden++){
sum+=activationHidden[hidden]*weights[(inputSize+1)*NO_HIDDEN_NEURONS+hidden];
}
sum+=weights[(inputSize+1)*NO_HIDDEN_NEURONS+NO_HIDDEN_NEURONS];
if(sum>0)sum=1;
else  sum=0;
sum=outputs[offsetOutputs+i]-sum;
if(sum!=0){
for(int hidden=0;hidden<NO_HIDDEN_NEURONS;hidden++){
weightsDeltas[offsetDeltas+(inputSize+1)*NO_HIDDEN_NEURONS+hidden]+=sum*activationHidden[hidden];
}
weightsDeltas[offsetDeltas+(inputSize+1)*NO_HIDDEN_NEURONS+NO_HIDDEN_NEURONS]+=sum;

error=sum*weights[(inputSize+1)*NO_HIDDEN_NEURONS+currentHidden];

if(error>0)error=1;
else error=0;

error=error-activationHidden[currentHidden];
if(error!=0){
for(int imageIndex=0;imageIndex<inputSize;imageIndex++){
weightsDeltas[offsetDeltas+(inputSize+1)*currentHidden+imageIndex]+=error*inputs[offsetInput+i*inputSize+imageIndex];
}
weightsDeltas[offsetDeltas+(inputSize+1)*currentHidden+inputSize]+=error;
}
}
}
}