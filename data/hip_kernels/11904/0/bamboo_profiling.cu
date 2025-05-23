#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <hip/hip_runtime.h>

#include <hip/hip_runtime.h>
#include <hip/hip_runtime.h>
#include <device_launch_parameters.h>

const int MAX_THREAD_NUMBER = 1000000;
extern "C" __device__ long long counterArray[MAX_THREAD_NUMBER];

long long dynamicKernelIndex = 0;

void bambooLogKernelBegin(int staticKernelIndex) {

}

void bambooLogKernelEnd(int staticKernelIndex) {

#ifdef KERNELTRACE
	hipDeviceSynchronize();
#endif

	long long resultArray[MAX_THREAD_NUMBER] = {0};
	hipMemcpyFromSymbol(&resultArray, HIP_SYMBOL(counterArray), MAX_THREAD_NUMBER * sizeof(long long), 0, hipMemcpyDeviceToHost);
	for(long long i=0; i<MAX_THREAD_NUMBER; i++){
		if(resultArray[i] != 0){
			//printf(" -- index %lld -- counter %lld --\n", i, resultArray[i]);
			FILE *profileFile = fopen("bamboo.profile.txt", "a");
			fprintf(profileFile, " -- threadIndex %lld -- instCount %lld -- dynamicKernelIndex %lld -- staticKernelIndex %d -- \n", i, resultArray[i], dynamicKernelIndex, staticKernelIndex);
			fclose(profileFile);
		}
	}
	memset(resultArray, 0, sizeof(resultArray));
	hipMemcpyToSymbol(HIP_SYMBOL(counterArray), &resultArray, MAX_THREAD_NUMBER * sizeof(long long), 0, hipMemcpyHostToDevice);
	dynamicKernelIndex++;
}
