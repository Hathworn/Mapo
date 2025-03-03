; ModuleID = '../data/hip_kernels/3491/34/main.cu'
source_filename = "../data/hip_kernels/3491/34/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i32> }

@_ZZ4scanPjS_S_ibbE6s_data = internal unnamed_addr addrspace(3) global [512 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z4scanPjS_S_ibb(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i1 %4, i1 %5) local_unnamed_addr #0 {
  %7 = bitcast i32 addrspace(1)* %1 to %struct.HIP_vector_type addrspace(1)*
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = shl nsw i32 %16, 2
  %18 = add nuw nsw i32 %17, 3
  %19 = icmp slt i32 %18, %3
  %20 = select i1 %4, i1 true, i1 %19
  br i1 %20, label %21, label %35

21:                                               ; preds = %6
  %22 = sext i32 %16 to i64
  %23 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %7, i64 %22, i32 0, i32 0, i32 0, i64 0
  %24 = bitcast i32 addrspace(1)* %23 to <2 x i32> addrspace(1)*
  %25 = load <2 x i32>, <2 x i32> addrspace(1)* %24, align 16
  %26 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %7, i64 %22, i32 0, i32 0, i32 0, i64 2
  %27 = load i32, i32 addrspace(1)* %26, align 8, !amdgpu.noclobber !5
  %28 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %7, i64 %22, i32 0, i32 0, i32 0, i64 3
  %29 = load i32, i32 addrspace(1)* %28, align 4, !amdgpu.noclobber !5
  %30 = extractelement <2 x i32> %25, i64 0
  %31 = extractelement <2 x i32> %25, i64 1
  %32 = add i32 %31, %30
  %33 = add i32 %27, %32
  %34 = add i32 %29, %33
  br label %69

35:                                               ; preds = %6
  %36 = icmp slt i32 %17, %3
  br i1 %36, label %37, label %43

37:                                               ; preds = %35
  %38 = sext i32 %17 to i64
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %38
  %40 = load i32, i32 addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !5
  %41 = uitofp i32 %40 to float
  %42 = fptoui float %41 to i32
  br label %43

43:                                               ; preds = %35, %37
  %44 = phi i32 [ %42, %37 ], [ 0, %35 ]
  %45 = add nuw nsw i32 %17, 1
  %46 = icmp slt i32 %45, %3
  br i1 %46, label %47, label %52

47:                                               ; preds = %43
  %48 = sext i32 %45 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !5
  %51 = uitofp i32 %50 to float
  br label %52

52:                                               ; preds = %43, %47
  %53 = phi contract float [ %51, %47 ], [ 0.000000e+00, %43 ]
  %54 = uitofp i32 %44 to float
  %55 = fadd contract float %53, %54
  %56 = fptoui float %55 to i32
  %57 = add nuw nsw i32 %17, 2
  %58 = icmp slt i32 %57, %3
  br i1 %58, label %59, label %64

59:                                               ; preds = %52
  %60 = sext i32 %57 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !5
  %63 = uitofp i32 %62 to float
  br label %64

64:                                               ; preds = %52, %59
  %65 = phi contract float [ %63, %59 ], [ 0.000000e+00, %52 ]
  %66 = uitofp i32 %56 to float
  %67 = fadd contract float %65, %66
  %68 = fptoui float %67 to i32
  br label %69

69:                                               ; preds = %64, %21
  %70 = phi i32 [ %33, %21 ], [ %68, %64 ]
  %71 = phi i32 [ %32, %21 ], [ %56, %64 ]
  %72 = phi i32 [ %30, %21 ], [ %44, %64 ]
  %73 = phi i32 [ %34, %21 ], [ %68, %64 ]
  %74 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ4scanPjS_S_ibbE6s_data, i32 0, i32 %15
  store i32 0, i32 addrspace(3)* %74, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %75 = add nuw nsw i32 %15, %13
  %76 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ4scanPjS_S_ibbE6s_data, i32 0, i32 %75
  store i32 %73, i32 addrspace(3)* %76, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %77 = add nsw i32 %75, -1
  %78 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ4scanPjS_S_ibbE6s_data, i32 0, i32 %77
  %79 = load i32, i32 addrspace(3)* %78, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %80 = load i32, i32 addrspace(3)* %76, align 4, !tbaa !7
  %81 = add i32 %80, %79
  store i32 %81, i32 addrspace(3)* %76, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %82 = add nsw i32 %75, -2
  %83 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ4scanPjS_S_ibbE6s_data, i32 0, i32 %82
  %84 = load i32, i32 addrspace(3)* %83, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %85 = load i32, i32 addrspace(3)* %76, align 4, !tbaa !7
  %86 = add i32 %85, %84
  store i32 %86, i32 addrspace(3)* %76, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %87 = add nsw i32 %75, -4
  %88 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ4scanPjS_S_ibbE6s_data, i32 0, i32 %87
  %89 = load i32, i32 addrspace(3)* %88, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %90 = load i32, i32 addrspace(3)* %76, align 4, !tbaa !7
  %91 = add i32 %90, %89
  store i32 %91, i32 addrspace(3)* %76, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %92 = add nsw i32 %75, -8
  %93 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ4scanPjS_S_ibbE6s_data, i32 0, i32 %92
  %94 = load i32, i32 addrspace(3)* %93, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %95 = load i32, i32 addrspace(3)* %76, align 4, !tbaa !7
  %96 = add i32 %95, %94
  store i32 %96, i32 addrspace(3)* %76, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %97 = add nsw i32 %75, -16
  %98 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ4scanPjS_S_ibbE6s_data, i32 0, i32 %97
  %99 = load i32, i32 addrspace(3)* %98, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %100 = load i32, i32 addrspace(3)* %76, align 4, !tbaa !7
  %101 = add i32 %100, %99
  store i32 %101, i32 addrspace(3)* %76, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %102 = add nsw i32 %75, -32
  %103 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ4scanPjS_S_ibbE6s_data, i32 0, i32 %102
  %104 = load i32, i32 addrspace(3)* %103, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %105 = load i32, i32 addrspace(3)* %76, align 4, !tbaa !7
  %106 = add i32 %105, %104
  store i32 %106, i32 addrspace(3)* %76, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %107 = add nsw i32 %75, -64
  %108 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ4scanPjS_S_ibbE6s_data, i32 0, i32 %107
  %109 = load i32, i32 addrspace(3)* %108, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %110 = load i32, i32 addrspace(3)* %76, align 4, !tbaa !7
  %111 = add i32 %110, %109
  store i32 %111, i32 addrspace(3)* %76, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %112 = add nsw i32 %75, -128
  %113 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ4scanPjS_S_ibbE6s_data, i32 0, i32 %112
  %114 = load i32, i32 addrspace(3)* %113, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %115 = load i32, i32 addrspace(3)* %76, align 4, !tbaa !7
  %116 = add i32 %115, %114
  store i32 %116, i32 addrspace(3)* %76, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %117 = load i32, i32 addrspace(3)* %78, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %118 = add nsw i32 %13, -1
  %119 = icmp eq i32 %15, %118
  %120 = select i1 %5, i1 %119, i1 false
  br i1 %120, label %121, label %125

121:                                              ; preds = %69
  %122 = add i32 %117, %73
  %123 = zext i32 %8 to i64
  %124 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %123
  store i32 %122, i32 addrspace(1)* %124, align 4, !tbaa !7
  br label %125

125:                                              ; preds = %121, %69
  %126 = bitcast i32 addrspace(1)* %0 to %struct.HIP_vector_type addrspace(1)*
  %127 = add i32 %117, %72
  %128 = add i32 %117, %71
  br i1 %20, label %129, label %136

129:                                              ; preds = %125
  %130 = add i32 %117, %70
  %131 = sext i32 %16 to i64
  %132 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %126, i64 %131, i32 0, i32 0, i32 0, i64 0
  store i32 %117, i32 addrspace(1)* %132, align 16
  %133 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %126, i64 %131, i32 0, i32 0, i32 0, i64 1
  store i32 %127, i32 addrspace(1)* %133, align 4
  %134 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %126, i64 %131, i32 0, i32 0, i32 0, i64 2
  store i32 %128, i32 addrspace(1)* %134, align 8
  %135 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %126, i64 %131, i32 0, i32 0, i32 0, i64 3
  store i32 %130, i32 addrspace(1)* %135, align 4
  br label %151

136:                                              ; preds = %125
  %137 = icmp slt i32 %17, %3
  br i1 %137, label %138, label %151

138:                                              ; preds = %136
  %139 = sext i32 %17 to i64
  %140 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %139
  store i32 %117, i32 addrspace(1)* %140, align 4, !tbaa !7
  %141 = add nuw nsw i32 %17, 1
  %142 = icmp slt i32 %141, %3
  br i1 %142, label %143, label %151

143:                                              ; preds = %138
  %144 = sext i32 %141 to i64
  %145 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %144
  store i32 %127, i32 addrspace(1)* %145, align 4, !tbaa !7
  %146 = add nuw nsw i32 %17, 2
  %147 = icmp slt i32 %146, %3
  br i1 %147, label %148, label %151

148:                                              ; preds = %143
  %149 = sext i32 %146 to i64
  %150 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %149
  store i32 %128, i32 addrspace(1)* %150, align 4, !tbaa !7
  br label %151

151:                                              ; preds = %136, %143, %148, %138, %129
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
