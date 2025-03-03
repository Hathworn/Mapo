; ModuleID = '../data/hip_kernels/12526/2/main.cu'
source_filename = "../data/hip_kernels/12526/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ11mult_sharedPiS_S_iE1a = internal unnamed_addr addrspace(3) global [32 x [32 x i32]] undef, align 16
@_ZZ11mult_sharedPiS_S_iE1b = internal unnamed_addr addrspace(3) global [32 x [32 x i32]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11mult_sharedPiS_S_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 5
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = add i32 %6, %7
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = shl i32 %9, 5
  %11 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %8, %3
  %14 = icmp slt i32 %12, %3
  %15 = select i1 %13, i1 %14, i1 false
  br i1 %15, label %16, label %236

16:                                               ; preds = %4
  %17 = icmp sgt i32 %3, 0
  %18 = mul nsw i32 %8, %3
  br i1 %17, label %19, label %231

19:                                               ; preds = %16
  %20 = add i32 %18, %11
  %21 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 %7, i32 %11
  %22 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 %11, i32 %7
  %23 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 0, i32 %7
  %24 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 0, i32 %11
  %25 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 1, i32 %7
  %26 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 1, i32 %11
  %27 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 2, i32 %7
  %28 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 2, i32 %11
  %29 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 3, i32 %7
  %30 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 3, i32 %11
  %31 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 4, i32 %7
  %32 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 4, i32 %11
  %33 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 5, i32 %7
  %34 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 5, i32 %11
  %35 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 6, i32 %7
  %36 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 6, i32 %11
  %37 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 7, i32 %7
  %38 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 7, i32 %11
  %39 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 8, i32 %7
  %40 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 8, i32 %11
  %41 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 9, i32 %7
  %42 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 9, i32 %11
  %43 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 10, i32 %7
  %44 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 10, i32 %11
  %45 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 11, i32 %7
  %46 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 11, i32 %11
  %47 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 12, i32 %7
  %48 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 12, i32 %11
  %49 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 13, i32 %7
  %50 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 13, i32 %11
  %51 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 14, i32 %7
  %52 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 14, i32 %11
  %53 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 15, i32 %7
  %54 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 15, i32 %11
  %55 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 16, i32 %7
  %56 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 16, i32 %11
  %57 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 17, i32 %7
  %58 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 17, i32 %11
  %59 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 18, i32 %7
  %60 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 18, i32 %11
  %61 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 19, i32 %7
  %62 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 19, i32 %11
  %63 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 20, i32 %7
  %64 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 20, i32 %11
  %65 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 21, i32 %7
  %66 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 21, i32 %11
  %67 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 22, i32 %7
  %68 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 22, i32 %11
  %69 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 23, i32 %7
  %70 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 23, i32 %11
  %71 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 24, i32 %7
  %72 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 24, i32 %11
  %73 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 25, i32 %7
  %74 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 25, i32 %11
  %75 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 26, i32 %7
  %76 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 26, i32 %11
  %77 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 27, i32 %7
  %78 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 27, i32 %11
  %79 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 28, i32 %7
  %80 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 28, i32 %11
  %81 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 29, i32 %7
  %82 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 29, i32 %11
  %83 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 30, i32 %7
  %84 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 30, i32 %11
  %85 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1a, i32 0, i32 31, i32 %7
  %86 = getelementptr inbounds [32 x [32 x i32]], [32 x [32 x i32]] addrspace(3)* @_ZZ11mult_sharedPiS_S_iE1b, i32 0, i32 31, i32 %11
  br label %87

87:                                               ; preds = %19, %87
  %88 = phi i32 [ 0, %19 ], [ %228, %87 ]
  %89 = phi i32 [ 0, %19 ], [ %229, %87 ]
  %90 = shl nsw i32 %89, 5
  %91 = add i32 %20, %90
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %92
  %94 = load i32, i32 addrspace(1)* %93, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %94, i32 addrspace(3)* %21, align 4, !tbaa !5
  %95 = add nuw i32 %90, %7
  %96 = mul i32 %95, %3
  %97 = add i32 %96, %12
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %98
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %100, i32 addrspace(3)* %22, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %101 = load i32, i32 addrspace(3)* %23, align 4, !tbaa !5
  %102 = load i32, i32 addrspace(3)* %24, align 4, !tbaa !5
  %103 = mul nsw i32 %102, %101
  %104 = add nsw i32 %103, %88
  %105 = load i32, i32 addrspace(3)* %25, align 4, !tbaa !5
  %106 = load i32, i32 addrspace(3)* %26, align 4, !tbaa !5
  %107 = mul nsw i32 %106, %105
  %108 = add nsw i32 %107, %104
  %109 = load i32, i32 addrspace(3)* %27, align 4, !tbaa !5
  %110 = load i32, i32 addrspace(3)* %28, align 4, !tbaa !5
  %111 = mul nsw i32 %110, %109
  %112 = add nsw i32 %111, %108
  %113 = load i32, i32 addrspace(3)* %29, align 4, !tbaa !5
  %114 = load i32, i32 addrspace(3)* %30, align 4, !tbaa !5
  %115 = mul nsw i32 %114, %113
  %116 = add nsw i32 %115, %112
  %117 = load i32, i32 addrspace(3)* %31, align 4, !tbaa !5
  %118 = load i32, i32 addrspace(3)* %32, align 4, !tbaa !5
  %119 = mul nsw i32 %118, %117
  %120 = add nsw i32 %119, %116
  %121 = load i32, i32 addrspace(3)* %33, align 4, !tbaa !5
  %122 = load i32, i32 addrspace(3)* %34, align 4, !tbaa !5
  %123 = mul nsw i32 %122, %121
  %124 = add nsw i32 %123, %120
  %125 = load i32, i32 addrspace(3)* %35, align 4, !tbaa !5
  %126 = load i32, i32 addrspace(3)* %36, align 4, !tbaa !5
  %127 = mul nsw i32 %126, %125
  %128 = add nsw i32 %127, %124
  %129 = load i32, i32 addrspace(3)* %37, align 4, !tbaa !5
  %130 = load i32, i32 addrspace(3)* %38, align 4, !tbaa !5
  %131 = mul nsw i32 %130, %129
  %132 = add nsw i32 %131, %128
  %133 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !5
  %134 = load i32, i32 addrspace(3)* %40, align 4, !tbaa !5
  %135 = mul nsw i32 %134, %133
  %136 = add nsw i32 %135, %132
  %137 = load i32, i32 addrspace(3)* %41, align 4, !tbaa !5
  %138 = load i32, i32 addrspace(3)* %42, align 4, !tbaa !5
  %139 = mul nsw i32 %138, %137
  %140 = add nsw i32 %139, %136
  %141 = load i32, i32 addrspace(3)* %43, align 4, !tbaa !5
  %142 = load i32, i32 addrspace(3)* %44, align 4, !tbaa !5
  %143 = mul nsw i32 %142, %141
  %144 = add nsw i32 %143, %140
  %145 = load i32, i32 addrspace(3)* %45, align 4, !tbaa !5
  %146 = load i32, i32 addrspace(3)* %46, align 4, !tbaa !5
  %147 = mul nsw i32 %146, %145
  %148 = add nsw i32 %147, %144
  %149 = load i32, i32 addrspace(3)* %47, align 4, !tbaa !5
  %150 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !5
  %151 = mul nsw i32 %150, %149
  %152 = add nsw i32 %151, %148
  %153 = load i32, i32 addrspace(3)* %49, align 4, !tbaa !5
  %154 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !5
  %155 = mul nsw i32 %154, %153
  %156 = add nsw i32 %155, %152
  %157 = load i32, i32 addrspace(3)* %51, align 4, !tbaa !5
  %158 = load i32, i32 addrspace(3)* %52, align 4, !tbaa !5
  %159 = mul nsw i32 %158, %157
  %160 = add nsw i32 %159, %156
  %161 = load i32, i32 addrspace(3)* %53, align 4, !tbaa !5
  %162 = load i32, i32 addrspace(3)* %54, align 4, !tbaa !5
  %163 = mul nsw i32 %162, %161
  %164 = add nsw i32 %163, %160
  %165 = load i32, i32 addrspace(3)* %55, align 4, !tbaa !5
  %166 = load i32, i32 addrspace(3)* %56, align 4, !tbaa !5
  %167 = mul nsw i32 %166, %165
  %168 = add nsw i32 %167, %164
  %169 = load i32, i32 addrspace(3)* %57, align 4, !tbaa !5
  %170 = load i32, i32 addrspace(3)* %58, align 4, !tbaa !5
  %171 = mul nsw i32 %170, %169
  %172 = add nsw i32 %171, %168
  %173 = load i32, i32 addrspace(3)* %59, align 4, !tbaa !5
  %174 = load i32, i32 addrspace(3)* %60, align 4, !tbaa !5
  %175 = mul nsw i32 %174, %173
  %176 = add nsw i32 %175, %172
  %177 = load i32, i32 addrspace(3)* %61, align 4, !tbaa !5
  %178 = load i32, i32 addrspace(3)* %62, align 4, !tbaa !5
  %179 = mul nsw i32 %178, %177
  %180 = add nsw i32 %179, %176
  %181 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !5
  %182 = load i32, i32 addrspace(3)* %64, align 4, !tbaa !5
  %183 = mul nsw i32 %182, %181
  %184 = add nsw i32 %183, %180
  %185 = load i32, i32 addrspace(3)* %65, align 4, !tbaa !5
  %186 = load i32, i32 addrspace(3)* %66, align 4, !tbaa !5
  %187 = mul nsw i32 %186, %185
  %188 = add nsw i32 %187, %184
  %189 = load i32, i32 addrspace(3)* %67, align 4, !tbaa !5
  %190 = load i32, i32 addrspace(3)* %68, align 4, !tbaa !5
  %191 = mul nsw i32 %190, %189
  %192 = add nsw i32 %191, %188
  %193 = load i32, i32 addrspace(3)* %69, align 4, !tbaa !5
  %194 = load i32, i32 addrspace(3)* %70, align 4, !tbaa !5
  %195 = mul nsw i32 %194, %193
  %196 = add nsw i32 %195, %192
  %197 = load i32, i32 addrspace(3)* %71, align 4, !tbaa !5
  %198 = load i32, i32 addrspace(3)* %72, align 4, !tbaa !5
  %199 = mul nsw i32 %198, %197
  %200 = add nsw i32 %199, %196
  %201 = load i32, i32 addrspace(3)* %73, align 4, !tbaa !5
  %202 = load i32, i32 addrspace(3)* %74, align 4, !tbaa !5
  %203 = mul nsw i32 %202, %201
  %204 = add nsw i32 %203, %200
  %205 = load i32, i32 addrspace(3)* %75, align 4, !tbaa !5
  %206 = load i32, i32 addrspace(3)* %76, align 4, !tbaa !5
  %207 = mul nsw i32 %206, %205
  %208 = add nsw i32 %207, %204
  %209 = load i32, i32 addrspace(3)* %77, align 4, !tbaa !5
  %210 = load i32, i32 addrspace(3)* %78, align 4, !tbaa !5
  %211 = mul nsw i32 %210, %209
  %212 = add nsw i32 %211, %208
  %213 = load i32, i32 addrspace(3)* %79, align 4, !tbaa !5
  %214 = load i32, i32 addrspace(3)* %80, align 4, !tbaa !5
  %215 = mul nsw i32 %214, %213
  %216 = add nsw i32 %215, %212
  %217 = load i32, i32 addrspace(3)* %81, align 4, !tbaa !5
  %218 = load i32, i32 addrspace(3)* %82, align 4, !tbaa !5
  %219 = mul nsw i32 %218, %217
  %220 = add nsw i32 %219, %216
  %221 = load i32, i32 addrspace(3)* %83, align 4, !tbaa !5
  %222 = load i32, i32 addrspace(3)* %84, align 4, !tbaa !5
  %223 = mul nsw i32 %222, %221
  %224 = add nsw i32 %223, %220
  %225 = load i32, i32 addrspace(3)* %85, align 4, !tbaa !5
  %226 = load i32, i32 addrspace(3)* %86, align 4, !tbaa !5
  %227 = mul nsw i32 %226, %225
  %228 = add nsw i32 %227, %224
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %229 = add nuw nsw i32 %89, 1
  %230 = icmp eq i32 %229, %3
  br i1 %230, label %231, label %87, !llvm.loop !10

231:                                              ; preds = %87, %16
  %232 = phi i32 [ 0, %16 ], [ %228, %87 ]
  %233 = add nsw i32 %18, %12
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %234
  store i32 %232, i32 addrspace(1)* %235, align 4, !tbaa !5
  br label %236

236:                                              ; preds = %231, %4
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
