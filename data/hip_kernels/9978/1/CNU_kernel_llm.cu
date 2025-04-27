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

/*_____________________________________________Begin CN Kernel___________________________________________________*/
#ifndef _CNU_KERNEL_H_
#define _CNU_KERNEL_H_

#ifndef max
#define max( a, b ) ( ((a) > (b)) ? (a) : (b) )
#endif

#define database_character( index)  CUT_BANK_CHECKER(database_character, index)
#define temp_1( index)              CUT_BANK_CHECKER(temp_1,             index)
#define temp_2( index)              CUT_BANK_CHECKER(temp_2,             index)

#endif // #ifndef _CNU_KERNEL_H_

__global__ void CNU_kernel(short int* offset_array, short int* results_array)
{
    extern __shared__ short int shared_mem[];
    short int* offset_ptr = shared_mem;
    short int* thread_Id_ptr = offset_ptr + 1;
    short int* current_Index_ptr = thread_Id_ptr + 1;

    // Cache threadId and global memory index using shared memory
    *thread_Id_ptr = threadIdx.x;
    *current_Index_ptr = (blockIdx.x * blockDim.x + *thread_Id_ptr) * 3;

    // Load offset once per thread block
    *offset_ptr = offset_array[*current_Index_ptr];

    // CN Kernel Logic using registers for faster access
    short int input1 = results_array[*current_Index_ptr + *offset_ptr];
    short int input2 = results_array[*current_Index_ptr + *offset_ptr + 1];
    short int input3 = results_array[*current_Index_ptr + *offset_ptr + 2];

    short int min1 = 0;
    short int min2 = 0;
    short int agr = 1;

    if (input1 < 0) agr = -agr;
    if (input2 < 0) agr = -agr;
    if (input3 < 0) agr = -agr;

    // Simplified minimum evaluation logic
    if (abs(input1) <= abs(input2)) {
        min1 = input1;
        min2 = input2;
    } else {
        min1 = input2;
        min2 = input1;
    }

    if (abs(input3) <= abs(min1)) {
        min2 = min1;
        min1 = input3;
    } else if (abs(input3) <= abs(min2)) {
        min2 = input3;
    }

    // Write results back to global memory
    results_array[*current_Index_ptr + *offset_ptr] = min2 * agr;
    results_array[*current_Index_ptr + *offset_ptr + 1] = min1 * agr;
    results_array[*current_Index_ptr + *offset_ptr + 2] = min1 * agr;
}