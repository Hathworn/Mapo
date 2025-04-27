#include "hip/hip_runtime.h"
#include "includes.h"

#ifndef _VNU_KERNEL_H_
#define _VNU_KERNEL_H_

#ifndef max
#define max( a, b ) ( ((a) > (b)) ? (a) : (b) )
#endif

#define database_character( index)  CUT_BANK_CHECKER(database_character, index)
#define temp_1( index)              CUT_BANK_CHECKER(temp_1,             index)
#define temp_2( index)              CUT_BANK_CHECKER(temp_2,             index)

#endif // #ifndef _VNU_KERNEL_H_

#ifndef _CNU_KERNEL_H_
#define _CNU_KERNEL_H_

#ifndef max
#define max( a, b ) ( ((a) > (b)) ? (a) : (b) )
#endif

#define database_character( index)  CUT_BANK_CHECKER(database_character, index)
#define temp_1( index)              CUT_BANK_CHECKER(temp_1,             index)
#define temp_2( index)              CUT_BANK_CHECKER(temp_2,             index)

#endif // #ifndef _CNU_KERNEL_H_

__global__ void VNU_kernel(short int* device_array, short int* offset_array, short int* sign_array, short int* results_array) {
    extern __shared__ short int shared[]; // Use external shared memory
    short int* offset = shared; 
    short int* current_Index = &shared[blockDim.x];

    int thread_Id = threadIdx.x;
    *current_Index = ((blockIdx.x * blockDim.x + thread_Id) * 2); // Calculate current_Index

    // Load offset into shared memory
    offset[thread_Id] = offset_array[*current_Index];
    __syncthreads(); // Ensure all offsets are loaded before computation

    short int input1 = results_array[*current_Index + offset[thread_Id]];
    short int input2 = results_array[*current_Index + offset[thread_Id] + 1];
    short int input3 = device_array[(*current_Index / 2) + offset[thread_Id]];

    short int sum = (input1 + input2 + input3);
    short int output1 = (sum - input1);
    short int output2 = (sum - input2);
    short int sign = (sum < 0) ? 1 : 0; // Condensed sign determination

    results_array[*current_Index + offset[thread_Id]] = output1;
    results_array[*current_Index + offset[thread_Id] + 1] = output2;
    sign_array[*current_Index + offset[thread_Id]] = sign;
    sign_array[*current_Index + offset[thread_Id] + 1] = sign;
}