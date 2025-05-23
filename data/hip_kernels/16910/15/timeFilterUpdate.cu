#include "hip/hip_runtime.h"
#include "includes.h"
const int  Nthreads = 1024, maxFR = 100000, NrankMax = 3, nmaxiter = 500, NchanMax = 32;
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

// THIS UPDATE DOES NOT UPDATE ELOSS?
//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////






//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
__global__ void	timeFilterUpdate(const double *Params, const float *data, const float *W, const bool *UtU, float *conv_sig, const int *st, const int *id, const int *counter){

volatile __shared__ float  sW[81*NrankMax], sW2[81*NrankMax];
float x;
int tid, tid0, bid, t, k,ind, Nrank, NT, Nfilt, nt0;

tid 		= threadIdx.x;
bid 		= blockIdx.x;
NT      	=   (int) Params[0];
Nfilt    	=   (int) Params[1];
Nrank     = (int) Params[6];
nt0       = (int) Params[4];

if (tid<nt0)
for (k=0;k<Nrank;k++)
sW[tid + k*nt0]= W[tid + nt0*bid + nt0*Nfilt * k];
__syncthreads();

for(ind=counter[1];ind<counter[0];ind++)
if (UtU[id[ind] + Nfilt *bid]){
tid0 = st[ind] - nt0 + tid;
if (tid0>=0 && tid0<NT-nt0){
x = 0.0f;
for (k=0;k<Nrank;k++)
for (t=0;t<nt0;t++)
x += sW[t +k*nt0] * data[t + tid0 + NT * bid + NT * Nfilt *k];

conv_sig[tid0 + NT*bid]   = x;
}

}

}